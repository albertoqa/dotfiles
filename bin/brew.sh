#!/usr/bin/env bash

# brew.sh
# Install command-line tools using Homebrew.

# IMPORTANT:
# Before run this script you need to install Xcode, agree to the license and
# install the command line developer tools. You can do it with:
# sudo xcodebuild -license
# sudo xcode-select --install

# Install brew (if not already installed)
if ! command -v brew >/dev/null 2>&1; then
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

# Install python (macOS version is outdated) and python3
# Both are compatibles and this way you can test the code in both
brew install python python3

# Install cask so we can install apps like ninjas
brew tap caskroom/cask



# Cleanup
brew cleanup
