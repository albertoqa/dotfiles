#!/bin/bash

# appsconfig.sh
# Configure a bunch of applications

###############################################################################
# Atom                                                                        #
###############################################################################

apm install highlight-selected
apm install pretty-json
apm install todo-show
apm install file-icons
apm install atom-beautify
apm install script
apm install project-manager
apm install docblockr
apm install auto-update-packages
apm install markdown-writer

apm install minimap
apm install minimap-linter
apm install minimap-cursorline
apm install minimap-find-and-replace
apm install minimap-git-diff
apm install minimap-highlight-selected

apm install linter
apm install linter-clang
apm install linter-csslint
apm install linter-htmlhint
apm install linter-jsonlint
apm install linter-javac
apm install linter-python
apm install linter-scalac
apm install linter-xmllint

apm install autocomplete-clang
apm install autocomplete-bibtex
apm install autocomplete-java-minus
apm install autocomplete-python
apm install autocomplete-paths
apm install autocomplete-xml

apm install atom-material-ui

# select material ui as the theme
# select one dark syntax for the syntax theme
# TODO

# add an icon to the dock
dockutil --add '/Applications/Atom.app' --replacing 'Atom'

###############################################################################
#                                                                             #
###############################################################################
