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

###############################################################################
# Transmission                                                                #
###############################################################################

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false

# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

# Automatically size window to fit all trasnfers
defaults write org.m0k.transmission AutoSize -bool true

# Prompt user fro removal of active transfers only when transfers are downloading
defaults write org.m0k.transmission CheckRemoveDownloading -bool true

# Prompt user for quit with active transfers only when transfers are downloading
defaults write org.m0k.transmission CheckQuitDownloading -bool true

# Display a window when opening a torrent file only if there are multiple files
defaults write org.m0k.transmission DownloadAskMulti -bool true

###############################################################################
# Day-O                                                                       #
###############################################################################

# Set preferred date/time format
defaults write com.shauninman.Day-O format -string "E d MMM H:mm"

# Don't show the icon
defaults write com.shauninman.Day-O showIcon -integer 0

# Set position in the bar to the first element (0)
defaults write com.shauninman.Day-O "NSStatusItem Preferred Position Item-0" -float 136.5
