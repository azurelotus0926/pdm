import argparse

import click

from pdm.cli import actions
from pdm.cli.commands.base import BaseCommand
from pdm.iostream import stream
from pdm.project import Project
from pdm.utils import get_python_version, get_user_email_from_git


class Command(BaseCommand):
    """Initialize a pyproject.toml for PDM"""

    def add_arguments(self, parser: argparse.ArgumentParser) -> None:
        parser.set_defaults(project=self.project_class("."))

    def handle(self, project: Project, options: argparse.Namespace) -> None:
        if project.pyproject_file.exists():
            stream.echo(
                "{}".format(
                    stream.cyan("pyproject.toml already exists, update it now.")
                )
            )
        else:
            stream.echo(
                "{}".format(stream.cyan("Creating a pyproject.toml for PDM..."))
            )
        python = click.prompt(
            "Please enter the Python interpreter to use", default="", show_default=False
        )
        actions.do_use(project, python)
        name = click.prompt(f"Project name", default=project.root.name)
        version = click.prompt("Project version", default="0.0.0")
        license = click.prompt("License(SPDX name)", default="MIT")

        git_user, git_email = get_user_email_from_git()
        author = click.prompt(f"Author name", default=git_user)
        email = click.prompt(f"Author email", default=git_email)
        python_version = ".".join(
            map(str, get_python_version(project.environment.python_executable)[:2])
        )
        python_requires = click.prompt(
            "Python requires('*' to allow any)", default=f">={python_version}"
        )

        actions.do_init(project, name, version, license, author, email, python_requires)
