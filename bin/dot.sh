#!/bin/bash

# install.sh
# Install script for the dotfiles to the home directory
#
# Add or remove any file you want to copy to the dotfiles list
# Please remmember to change the git credentials in the gitconfig file
# and use yours... if not you are gonna be commiting with my name everywhere!

# dir where the originals are located: just the parent of the dir where this
# script is located
dotfiles_dir="$(cd "$(dirname "$0")"; pwd)/../"

# list of files to symlink in homedir
dotfiles="aliases bash_profile bash_prompt bashrc exports extras functions gitattributes gitconfig gitignore inputrc path"

echo "Getting dotfiles ready!"

mkdir -p ~/.dotfiles_old   # backup folder for all the current dotfiles

# create symlinks for all the listed files
for dot in $dotfiles; do
  if [ -f ~/.$dot ]; then
    mv ~/.$dot ~/.dotfiles_old/  # if file already exists, backup it!
  fi
  ln -s $dotfiles_dir/$dot ~/.$dot       # create a symlink of the file in the homedir
done

echo "Successfully created symlinks for the dotfiles."
