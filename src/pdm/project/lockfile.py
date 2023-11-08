from __future__ import annotations

import enum
from typing import Any, Iterable, Mapping

import tomlkit
from packaging.version import Version

from pdm import termui
from pdm.exceptions import PdmUsageError
from pdm.project.toml_file import TOMLBase

GENERATED_COMMENTS = [
    "This file is @generated by PDM.",
    "It is not intended for manual editing.",
]
FLAG_STATIC_URLS = "static_urls"
FLAG_CROSS_PLATFORM = "cross_platform"
FLAG_DIRECT_MINIMAL_VERSIONS = "direct_minimal_versions"
SUPPORTED_FLAGS = frozenset((FLAG_STATIC_URLS, FLAG_CROSS_PLATFORM, FLAG_DIRECT_MINIMAL_VERSIONS))


class Compatibility(enum.IntEnum):
    NONE = 0  # The lockfile can't be read by the current version of PDM.
    SAME = 1  # The lockfile version is the same as the current version of PDM.
    BACKWARD = 2  # The current version of PDM is newer than the lockfile version.
    FORWARD = 3  # The current version of PDM is older than the lockfile version.


class Lockfile(TOMLBase):
    spec_version = Version("4.4")

    @property
    def hash(self) -> str:
        return self._data.get("metadata", {}).get("content_hash", "")

    @property
    def file_version(self) -> str:
        return self._data.get("metadata", {}).get("lock_version", "")

    @property
    def groups(self) -> list[str] | None:
        return self._data.get("metadata", {}).get("groups")

    @property
    def strategy(self) -> set[str]:
        metadata = self._data.get("metadata", {})
        result: set[str] = set(metadata.get("strategy", [FLAG_CROSS_PLATFORM]))
        if not metadata.get(FLAG_CROSS_PLATFORM, True):
            result.discard(FLAG_CROSS_PLATFORM)
        if metadata.get(FLAG_STATIC_URLS, False):
            result.add(FLAG_STATIC_URLS)
        return result & SUPPORTED_FLAGS

    def apply_strategy_change(self, changes: Iterable[str]) -> set[str]:
        original = self.strategy
        for change in changes:
            change = change.replace("-", "_").lower()
            if change.startswith("no_"):
                if change[3:] not in SUPPORTED_FLAGS:
                    raise PdmUsageError(f"Invalid strategy flag: {change[3:]}, supported: {', '.join(SUPPORTED_FLAGS)}")
                original.discard(change[3:])
            else:
                if change not in SUPPORTED_FLAGS:
                    raise PdmUsageError(f"Invalid strategy flag: {change}, supported: {', '.join(SUPPORTED_FLAGS)}")
                original.add(change)
        return original

    def compare_groups(self, groups: Iterable[str]) -> list[str]:
        if not self.groups:
            return []
        return list(set(groups).difference(self.groups))

    def set_data(self, data: Mapping[str, Any]) -> None:
        self._data = tomlkit.document()
        for line in GENERATED_COMMENTS:
            self._data.append(None, tomlkit.comment(line))
        self._data.update(data)

    def write(self, show_message: bool = True) -> None:
        super().write()
        if show_message:
            self.ui.echo(f"Changes are written to [success]{self._path.name}[/].", verbosity=termui.Verbosity.NORMAL)

    def __getitem__(self, key: str) -> dict:
        return self._data[key]

    def compatibility(self) -> Compatibility:
        """We use a three-part versioning scheme for lockfiles:
        The first digit represents backward compatibility and the second digit represents forward compatibility.
        """
        if not self.exists():
            return Compatibility.SAME
        if not self.file_version:
            return Compatibility.NONE
        lockfile_version = Version(self.file_version)
        if lockfile_version == self.spec_version:
            return Compatibility.SAME
        if lockfile_version.major != self.spec_version.major or lockfile_version.minor > self.spec_version.minor:
            return Compatibility.NONE
        if lockfile_version.minor < self.spec_version.minor:
            return Compatibility.BACKWARD
        return Compatibility.BACKWARD if lockfile_version.micro < self.spec_version.micro else Compatibility.FORWARD
