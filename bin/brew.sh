#!/usr/bin/env bash

# brew.sh
# Install command-line tools using Homebrew.

# IMPORTANT:
# Before run this script you need to install Xcode, agree to the license and
# install the command line developer tools. You can do it with:
# sudo xcodebuild -license
# sudo xcode-select --install

# Install brew (if not already installed)
# TODO
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Check if the installation was ok
brew doctor
# TODO check the output of brew doctor and continue only if OK

# Update homebrew and any installed formulae
brew update
brew upgrade

# Install python (macOS version is outdated) and python3
# Both are compatibles and this way you can test the code in both
brew install python python3

brew tap caskroom/cask
brew install brew-cask

# Cleanup
brew cleanup
