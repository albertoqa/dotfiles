#!/usr/bin/env bash

# brew.sh
# Install command-line tools using Homebrew.
#
# IMPORTANT:
# Before run this script you need to install Xcode.

# agree to xcode license and install command line tools
sudo xcodebuild -license
sudo xcode-select --install

# Install brew (if not already installed)
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing brew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# Check if the installation was ok
brew doctor | grep 'Your system is ready to brew' &> /dev/null
if [ $? != 0 ]; then
  echo "An error ocurred and brew cannot be installed... exiting now"
  exit
fi

# Update homebrew and any installed formulae
brew update
brew upgrade

###############################################################################
# Tools and languages                                                         #
###############################################################################

# Install python (macOS version is outdated) and python3
# Both are compatibles and this way you can test the code in both
brew install python python3

# update pip and setuptools
pip install --upgrade pip setuptools
pip3 install --upgrade pip setuptools wheel

pip install virtualenv            # install virtualenv

brew install ack                  # search for things within a repo
brew install the_silver_searcher  # alternative to ack maybe faster
brew install wget                 # similar to curl
brew install speedtest_cli        # test internet bandwidth using speedtest.net
brew install ssh-copy-id          # install your public key in a remote machine's authorized_keys
brew install rename               # rename files easy
brew install htop                 # better top replacement
brew install tree                 # display full directory hierarchy
brew install pstree               # display running processes as a tree
brew install pv                   # show progress bar in pipelines
brew install iftop                # show network usage (similar to top)
brew install unrar                # decompress rar files
brew install dockutil             # manage dock items from the terminal

brew install node
brew install mongodb
brew install mysql

###############################################################################
# Cask                                                                        #
###############################################################################

# Install cask so we can install apps like ninjas
brew tap caskroom/cask

# Allow completion on brew cask
brew install homebrew/completions/brew-cask-completion

###############################################################################
# Quicklook                                                                   #
###############################################################################

brew cask install qlmarkdown        # preview Markdown files
brew cask install qlstephen         # preview plain text files without a extension
brew cask install qlcolorcode       # preview source code with syntax highlight
brew cask install quicklook-json    # preview JSON files
brew cask install quicklook-csv     # preview CSV files
brew cask install qlprettypatch     # preview diffs
brew cask install betterzipql       # preview archives

# Enable text selection in QuickLook views. TODO check
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

###############################################################################
# Apps                                                                        #
###############################################################################

# Install all our favourite apps without even a single click 😮

# Social
brew cask install adium
brew cask install skype
brew cask install slack
brew cask install whatsapp

# Office
brew cask install macdown

# Utilities
brew cask install flux
brew cask install the-unarchiver

# General
brew cask install google-drive
brew cask install google-chrome
brew cask install firefox
brew cask install spotify
brew cask install vlc
brew cask install transmission

# Java
sudo brew cask install java
brew install scala
brew install maven
brew install sonar
brew install sonar-scanner

# Development
brew cask install atom
brew cask install postman
brew cask install github-desktop
brew cask install intellij-idea
brew cask install pycharm
brew cask install android-studio
brew cask install textwrangler
brew cask install netbeans-java-ee
brew cask install mysqlworkbench

# Graphics
brew cask install icons8
brew cask install image2icon
brew cask install imagealpha
brew cask install imageoptim

# Cleanup
brew cleanup
