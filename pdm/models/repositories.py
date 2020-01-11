import sys

from contextlib import contextmanager
from functools import wraps
from typing import Callable
from typing import List
from typing import Optional
from typing import Tuple

import pip_shims

from pdm.context import context
from pdm.exceptions import CandidateInfoNotFound
from pdm.exceptions import CorruptedCacheError
from pdm.models.candidates import Candidate
from pdm.models.requirements import Requirement
from pdm.models.requirements import filter_requirements_with_extras
from pdm.models.specifiers import PySpecSet
from pdm.models.specifiers import SpecifierSet
from pdm.types import CandidateInfo
from pdm.types import Source
from pdm.utils import _allow_all_wheels
from pdm.utils import get_finder


def cache_result(
    func: Callable[["BaseRepository", Candidate], CandidateInfo]
) -> Callable[["BaseRepository", Candidate], CandidateInfo]:
    @wraps(func)
    def wrapper(self, candidate: Candidate) -> CandidateInfo:
        result = func(self, candidate)
        self._candidate_info_cache.set(candidate, result)
        return result

    return wrapper


class BaseRepository:
    def __init__(self, sources: List[Source]) -> None:
        self.sources = sources
        self._candidate_info_cache = context.make_candidate_info_cache()
        self._hash_cache = context.make_hash_cache()

    @contextmanager
    def get_finder(
        self,
        sources: Optional[List[Source]] = None,
        requires_python: Optional[PySpecSet] = None,
        ignore_requires_python: bool = False,
    ) -> pip_shims.PackageFinder:
        sources = sources or self.sources

        finder = get_finder(
            sources,
            context.cache_dir.as_posix(),
            requires_python.max_major_minor_version() if requires_python else None,
            ignore_requires_python,
        )
        yield finder
        finder.session.close()

    def get_filtered_sources(self, req: Requirement) -> List[Source]:
        if not req.index:
            return self.sources
        return [source for source in self.sources if source["name"] == req.index]

    def get_dependencies(
        self, candidate: Candidate
    ) -> Tuple[List[Requirement], PySpecSet, str]:
        raise NotImplementedError

    def find_matches(
        self,
        requirement: Requirement,
        requires_python: PySpecSet = PySpecSet(),
        allow_prereleases: Optional[bool] = None,
        allow_all: bool = False,
    ) -> List[Candidate]:
        if requirement.is_named:
            return self._find_named_matches(
                requirement, requires_python, allow_prereleases
            )
        else:
            return [Candidate(requirement, self)]

    def _find_named_matches(
        self,
        requirement: Requirement,
        requires_python: PySpecSet = PySpecSet(),
        allow_prereleases: Optional[bool] = None,
        allow_all: bool = False,
    ) -> List[Candidate]:
        """Find candidates of the given NamedRequirement. Let it to be implemented in
        subclasses.
        """
        raise NotImplementedError

    def _get_dependencies_from_cache(self, candidate: Candidate) -> CandidateInfo:
        try:
            result = self._candidate_info_cache.get(candidate)
        except CorruptedCacheError:
            self._candidate_info_cache.clear()
            raise CandidateInfoNotFound(candidate)
        except KeyError:
            raise CandidateInfoNotFound(candidate)
        return result

    @cache_result
    def _get_dependencies_from_metadata(self, candidate: Candidate) -> CandidateInfo:
        candidate.prepare_source()
        deps = candidate.get_dependencies_from_metadata()
        requires_python = candidate.requires_python
        summary = candidate.metadata.summary
        return deps, requires_python, summary

    def get_hashes(self, candidate: Candidate) -> None:
        if candidate.hashes or candidate.req.is_vcs:
            return
        req = candidate.req.copy()
        req.specifier = SpecifierSet(f"=={candidate.version}")
        with _allow_all_wheels():
            matching_candidates = self.find_matches(req, allow_all=True)
        with self.get_finder() as finder:
            self._hash_cache.session = finder.session
            candidate.hashes = {
                c.link.filename: self._hash_cache.get_hash(c.link)
                for c in matching_candidates
            }


class PyPIRepository(BaseRepository):
    @cache_result
    def _get_dependencies_from_json(self, candidate: Candidate) -> CandidateInfo:
        if not candidate.name or not candidate.version:
            # Only look for json api for named requirements.
            raise CandidateInfoNotFound(candidate)
        sources = self.get_filtered_sources(candidate.req)
        url_prefixes = [
            proc_url[:-7]  # Strip "/simple".
            for proc_url in (
                raw_url.rstrip("/")
                for raw_url in (source.get("url", "") for source in sources)
            )
            if proc_url.endswith("/simple")
        ]
        with self.get_finder(sources) as finder:
            session = finder.session
            for prefix in url_prefixes:
                json_url = f"{prefix}/pypi/{candidate.name}/{candidate.version}/json"
                resp = session.get(json_url)
                if not resp.ok:
                    continue

                info = resp.json()["info"]

                requires_python = info["requires_python"] or ""
                summary = info["summary"] or ""
                try:
                    requirement_lines = info["requires_dist"] or []
                except KeyError:
                    requirement_lines = info["requires"] or []
                requirements = filter_requirements_with_extras(
                    requirement_lines, candidate.req.extras or ()
                )
                return requirements, requires_python, summary
        raise CandidateInfoNotFound(candidate)

    def get_dependencies(
        self, candidate: Candidate
    ) -> Tuple[List[Requirement], PySpecSet, str]:
        requirements, requires_python, summary = [], "", ""
        last_ext_info = None
        for getter in (
            self._get_dependencies_from_cache,
            self._get_dependencies_from_json,
            self._get_dependencies_from_metadata,
        ):
            try:
                requirements, requires_python, summary = getter(candidate)
            except CandidateInfoNotFound:
                last_ext_info = sys.exc_info()
                continue
            break
        else:
            if last_ext_info is not None:
                raise last_ext_info[0].with_traceback(last_ext_info[2])
        requirements = [Requirement.from_line(line) for line in requirements]
        if candidate.req.extras:
            # HACK: If this candidate has extras, add the original candidate
            # (same pinned version, no extras) as its dependency. This ensures
            # the same package with different extras (treated as distinct by
            # the resolver) have the same version.
            self_req = candidate.req.copy()
            self_req.extras = None
            requirements.append(self_req)
        return requirements, PySpecSet(requires_python), summary

    def _find_named_matches(
        self,
        requirement: Requirement,
        requires_python: PySpecSet = PySpecSet(),
        allow_prereleases: Optional[bool] = None,
        allow_all: bool = False,
    ) -> List[Candidate]:
        sources = self.get_filtered_sources(requirement)
        # `allow_prereleases` is None means leave it to specifier to decide whether to
        # include prereleases
        if allow_prereleases is None:
            allow_prereleases = requirement.allow_prereleases

        with self.get_finder(sources) as finder:
            cans = [
                Candidate.from_installation_candidate(c, requirement, self)
                for c in finder.find_all_candidates(requirement.project_name)
            ]
        sorted_cans = sorted(
            (
                c
                for c in cans
                if requirement.specifier.contains(c.version, allow_prereleases)
            ),
            key=lambda c: c.version,
        )
        if not allow_all:
            sorted_cans = [
                can
                for can in sorted_cans
                if requires_python.is_subset(can.requires_python)
            ]
        if not sorted_cans and not allow_prereleases:
            # No non-pre-releases is found, force pre-releases now
            sorted_cans = sorted(
                (c for c in cans if requirement.specifier.contains(c.version, True)),
                key=lambda c: c.version,
            )
        return sorted_cans
