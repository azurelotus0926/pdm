# FISH completion script for pdm
# Generated by pycomplete 0.3.2

function __fish_pdm_7426f3abf02b4bb8_complete_no_subcommand
    for i in (commandline -opc)
        if contains -- $i add build cache completion config export import info init install list lock plugin remove run search show sync update use
            return 1
        end
    end
    return 0
end

# global options
complete -c pdm -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -l help -d 'show this help message and exit'
complete -c pdm -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -l ignore-python -d 'Ignore the Python path saved in the pdm.toml config'
complete -c pdm -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -l pep582 -d 'Print the command line to be eval\'d by the shell'
complete -c pdm -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -l verbose -d '-v for detailed output and -vv for more detailed'
complete -c pdm -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -l version -d 'Show version'

# commands
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a add -d 'Add package(s) to pyproject.toml and install them'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a build -d 'Build artifacts for distribution'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a cache -d 'Control the caches of PDM'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a completion -d 'Generate completion scripts for the given shell'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a config -d 'Display the current configuration'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a export -d 'Export the locked packages set to other formats'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a import -d 'Import project metadata from other formats'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a info -d 'Show the project information'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a init -d 'Initialize a pyproject.toml for PDM'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a install -d 'Install dependencies from lock file'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a list -d 'List packages installed in the current working set'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a lock -d 'Resolve and lock dependencies'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a plugin -d 'Manage the PDM plugins'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a remove -d 'Remove packages from pyproject.toml'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a run -d 'Run commands or scripts with local packages loaded'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a search -d 'Search for PyPI packages'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a show -d 'Show the package information'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a sync -d 'Synchronize the current working set with lock file'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a update -d 'Update package(s) in pyproject.toml'
complete -c pdm -f -n '__fish_pdm_7426f3abf02b4bb8_complete_no_subcommand' -a use -d 'Use the given python version or path as base interpreter'

# command options

# add
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l dev -d 'Add packages into dev dependencies'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l editable -d 'Specify editable packages'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l no-editable -d 'Install non-editable versions for all packages'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l no-self -d 'Don\'t install the project itself'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l no-sync -d 'Only write pyproject.toml and do not sync the working set'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l save-compatible -d 'Save compatible version specifiers'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l save-exact -d 'Save exact version specifiers'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l save-wildcard -d 'Save wildcard version specifiers'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l section -d 'Specify target section to add into'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l unconstrained -d 'Ignore the version constraint of pinned packages'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l update-eager -d 'Try to update the packages and their dependencies recursively'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l update-reuse -d 'Reuse pinned versions already present in lock file if possible'
complete -c pdm -A -n '__fish_seen_subcommand_from add' -l verbose -d '-v for detailed output and -vv for more detailed'

# build
complete -c pdm -A -n '__fish_seen_subcommand_from build' -l config-setting -d 'Pass options to the backend. options with a value must be specified after "=": "--config-setting=--opt(=value)" or "-C--opt(=value)"'
complete -c pdm -A -n '__fish_seen_subcommand_from build' -l dest -d 'Target directory to put artifacts'
complete -c pdm -A -n '__fish_seen_subcommand_from build' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from build' -l no-clean -d 'Do not clean the target directory'
complete -c pdm -A -n '__fish_seen_subcommand_from build' -l no-sdist -d 'Don\'t build source tarballs'
complete -c pdm -A -n '__fish_seen_subcommand_from build' -l no-wheel -d 'Don\'t build wheels'
complete -c pdm -A -n '__fish_seen_subcommand_from build' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from build' -l verbose -d '-v for detailed output and -vv for more detailed'

# cache
complete -c pdm -A -n '__fish_seen_subcommand_from cache' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from cache' -l verbose -d '-v for detailed output and -vv for more detailed'

# completion
complete -c pdm -A -n '__fish_seen_subcommand_from completion' -l help -d 'show this help message and exit'

# config
complete -c pdm -A -n '__fish_seen_subcommand_from config' -l delete -d 'Unset a configuration key'
complete -c pdm -A -n '__fish_seen_subcommand_from config' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from config' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from config' -l local -d 'Set config in the project\'s local configuration filie'
complete -c pdm -A -n '__fish_seen_subcommand_from config' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from config' -l verbose -d '-v for detailed output and -vv for more detailed'

# export
complete -c pdm -A -n '__fish_seen_subcommand_from export' -l dev -d 'Select dev dependencies'
complete -c pdm -A -n '__fish_seen_subcommand_from export' -l format -d 'Specify the export file format'
complete -c pdm -A -n '__fish_seen_subcommand_from export' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from export' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from export' -l no-default -d 'Don\'t include dependencies from default section'
complete -c pdm -A -n '__fish_seen_subcommand_from export' -l output -d 'Write output to the given file, or print to stdout if not given'
complete -c pdm -A -n '__fish_seen_subcommand_from export' -l production -d 'Unselect dev dependencies'
complete -c pdm -A -n '__fish_seen_subcommand_from export' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from export' -l pyproject -d 'Read the list of packages from pyproject.toml'
complete -c pdm -A -n '__fish_seen_subcommand_from export' -l section -d 'Select section of optional-dependencies or dev-dependencies(with -d). Can be supplied multiple times, use ":all" to include all groups under the same species.'
complete -c pdm -A -n '__fish_seen_subcommand_from export' -l verbose -d '-v for detailed output and -vv for more detailed'
complete -c pdm -A -n '__fish_seen_subcommand_from export' -l without-hashes -d 'Don\'t include artifact hashes'

# import
complete -c pdm -A -n '__fish_seen_subcommand_from import' -l dev -d 'import packages into dev dependencies'
complete -c pdm -A -n '__fish_seen_subcommand_from import' -l format -d 'Specify the file format explicitly'
complete -c pdm -A -n '__fish_seen_subcommand_from import' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from import' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from import' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from import' -l section -d 'Specify target section to import into'
complete -c pdm -A -n '__fish_seen_subcommand_from import' -l verbose -d '-v for detailed output and -vv for more detailed'

# info
complete -c pdm -A -n '__fish_seen_subcommand_from info' -l env -d 'Show PEP 508 environment markers'
complete -c pdm -A -n '__fish_seen_subcommand_from info' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from info' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from info' -l packages -d 'Show the packages root'
complete -c pdm -A -n '__fish_seen_subcommand_from info' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from info' -l python -d 'Show the interpreter path'
complete -c pdm -A -n '__fish_seen_subcommand_from info' -l verbose -d '-v for detailed output and -vv for more detailed'
complete -c pdm -A -n '__fish_seen_subcommand_from info' -l where -d 'Show the project root path'

# init
complete -c pdm -A -n '__fish_seen_subcommand_from init' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from init' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from init' -l non-interactive -d 'Don\'t ask questions but use default values'
complete -c pdm -A -n '__fish_seen_subcommand_from init' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from init' -l verbose -d '-v for detailed output and -vv for more detailed'

# install
complete -c pdm -A -n '__fish_seen_subcommand_from install' -l dev -d 'Select dev dependencies'
complete -c pdm -A -n '__fish_seen_subcommand_from install' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from install' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from install' -l no-default -d 'Don\'t include dependencies from default section'
complete -c pdm -A -n '__fish_seen_subcommand_from install' -l no-editable -d 'Install non-editable versions for all packages'
complete -c pdm -A -n '__fish_seen_subcommand_from install' -l no-lock -d 'Don\'t do lock if lockfile is not found or outdated.'
complete -c pdm -A -n '__fish_seen_subcommand_from install' -l no-self -d 'Don\'t install the project itself'
complete -c pdm -A -n '__fish_seen_subcommand_from install' -l production -d 'Unselect dev dependencies'
complete -c pdm -A -n '__fish_seen_subcommand_from install' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from install' -l section -d 'Select section of optional-dependencies or dev-dependencies(with -d). Can be supplied multiple times, use ":all" to include all groups under the same species.'
complete -c pdm -A -n '__fish_seen_subcommand_from install' -l verbose -d '-v for detailed output and -vv for more detailed'

# list
complete -c pdm -A -n '__fish_seen_subcommand_from list' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from list' -l graph -d 'Display a graph of dependencies'
complete -c pdm -A -n '__fish_seen_subcommand_from list' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from list' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from list' -l reverse -d 'Reverse the dependency graph'
complete -c pdm -A -n '__fish_seen_subcommand_from list' -l verbose -d '-v for detailed output and -vv for more detailed'

# lock
complete -c pdm -A -n '__fish_seen_subcommand_from lock' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from lock' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from lock' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from lock' -l verbose -d '-v for detailed output and -vv for more detailed'

# plugin
complete -c pdm -A -n '__fish_seen_subcommand_from plugin' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from plugin' -l verbose -d '-v for detailed output and -vv for more detailed'

# remove
complete -c pdm -A -n '__fish_seen_subcommand_from remove' -l dev -d 'Remove packages from dev dependencies'
complete -c pdm -A -n '__fish_seen_subcommand_from remove' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from remove' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from remove' -l no-editable -d 'Install non-editable versions for all packages'
complete -c pdm -A -n '__fish_seen_subcommand_from remove' -l no-self -d 'Don\'t install the project itself'
complete -c pdm -A -n '__fish_seen_subcommand_from remove' -l no-sync -d 'Only write pyproject.toml and do not uninstall packages'
complete -c pdm -A -n '__fish_seen_subcommand_from remove' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from remove' -l section -d 'Specify the section the package belongs to'
complete -c pdm -A -n '__fish_seen_subcommand_from remove' -l verbose -d '-v for detailed output and -vv for more detailed'

# run
complete -c pdm -A -n '__fish_seen_subcommand_from run' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from run' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from run' -l list -d 'Show all available scripts defined in pyproject.toml'
complete -c pdm -A -n '__fish_seen_subcommand_from run' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from run' -l verbose -d '-v for detailed output and -vv for more detailed'

# search
complete -c pdm -A -n '__fish_seen_subcommand_from search' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from search' -l verbose -d '-v for detailed output and -vv for more detailed'

# show
complete -c pdm -A -n '__fish_seen_subcommand_from show' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from show' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from show' -l keywords -d 'Show keywords'
complete -c pdm -A -n '__fish_seen_subcommand_from show' -l license -d 'Show license'
complete -c pdm -A -n '__fish_seen_subcommand_from show' -l name -d 'Show name'
complete -c pdm -A -n '__fish_seen_subcommand_from show' -l platform -d 'Show platform'
complete -c pdm -A -n '__fish_seen_subcommand_from show' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from show' -l summary -d 'Show summary'
complete -c pdm -A -n '__fish_seen_subcommand_from show' -l verbose -d '-v for detailed output and -vv for more detailed'
complete -c pdm -A -n '__fish_seen_subcommand_from show' -l version -d 'Show version'

# sync
complete -c pdm -A -n '__fish_seen_subcommand_from sync' -l clean -d 'clean unused packages'
complete -c pdm -A -n '__fish_seen_subcommand_from sync' -l dev -d 'Select dev dependencies'
complete -c pdm -A -n '__fish_seen_subcommand_from sync' -l dry-run -d 'Show the difference only and don\'t perform any action'
complete -c pdm -A -n '__fish_seen_subcommand_from sync' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from sync' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from sync' -l no-clean -d 'don\'t clean unused packages'
complete -c pdm -A -n '__fish_seen_subcommand_from sync' -l no-default -d 'Don\'t include dependencies from default section'
complete -c pdm -A -n '__fish_seen_subcommand_from sync' -l no-editable -d 'Install non-editable versions for all packages'
complete -c pdm -A -n '__fish_seen_subcommand_from sync' -l no-self -d 'Don\'t install the project itself'
complete -c pdm -A -n '__fish_seen_subcommand_from sync' -l production -d 'Unselect dev dependencies'
complete -c pdm -A -n '__fish_seen_subcommand_from sync' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from sync' -l section -d 'Select section of optional-dependencies or dev-dependencies(with -d). Can be supplied multiple times, use ":all" to include all groups under the same species.'
complete -c pdm -A -n '__fish_seen_subcommand_from sync' -l verbose -d '-v for detailed output and -vv for more detailed'

# update
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l dev -d 'Select dev dependencies'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l no-default -d 'Don\'t include dependencies from default section'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l no-editable -d 'Install non-editable versions for all packages'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l no-self -d 'Don\'t install the project itself'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l outdated -d 'Show the difference only without modifying the lockfile content'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l production -d 'Unselect dev dependencies'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l save-compatible -d 'Save compatible version specifiers'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l save-exact -d 'Save exact version specifiers'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l save-wildcard -d 'Save wildcard version specifiers'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l section -d 'Select section of optional-dependencies or dev-dependencies(with -d). Can be supplied multiple times, use ":all" to include all groups under the same species.'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l top -d 'Only update those list in pyproject.toml'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l unconstrained -d 'Ignore the version constraint of packages'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l update-eager -d 'Try to update the packages and their dependencies recursively'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l update-reuse -d 'Reuse pinned versions already present in lock file if possible'
complete -c pdm -A -n '__fish_seen_subcommand_from update' -l verbose -d '-v for detailed output and -vv for more detailed'

# use
complete -c pdm -A -n '__fish_seen_subcommand_from use' -l first -d 'Select the first matched interpreter'
complete -c pdm -A -n '__fish_seen_subcommand_from use' -l global -d 'Use the global project, supply the project root with `-p` option'
complete -c pdm -A -n '__fish_seen_subcommand_from use' -l help -d 'show this help message and exit'
complete -c pdm -A -n '__fish_seen_subcommand_from use' -l project -d 'Specify another path as the project root, which changes the base of pyproject.toml and __pypackages__'
complete -c pdm -A -n '__fish_seen_subcommand_from use' -l verbose -d '-v for detailed output and -vv for more detailed'
