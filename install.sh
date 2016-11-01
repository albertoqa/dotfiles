#!/bin/bash

# install.sh
# Install script for the dotfiles to the home directory

# list of files to symlink in homedir
dotfiles_dir=~/Developer/dotfiles/
dotfiles="aliases bash_profile bash_prompt bashrc curlrc editorconfig exports extras functions gitattributes gitconfig gitignore gvimrc hgignore inputrc path screenrc viminfo vimrc wgetrc"

mkdir -p ~/.dotfiles_old   # backup folder for all the current dotfiles

for dot in $dotfiles; do
  if [ -f ~/.$dot ]; then
    mv ~/.$dot ~/.dotfiles_old/  # if file already exists, backup it!
  fi
  ln -s $dotfiles_dir/$dot ~/.$dot       # create a symlink of the file in the homedir
done
