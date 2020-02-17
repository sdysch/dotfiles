#!/bin/bash

####################################################################################

# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles_mac

####################################################################################

link_configs() {
    # dotfiles directory
    dir=~/dotfiles_harmonised
    # old dotfiles backup directory
    olddir=~/dotfiles_backup

    # list of files/folders to symlink in homedir
    files="bash_profile bash_aliases bash_aliases_mac bash_aliases_lxplus vimrc gitconfig_common gitconfig_lxplus gitconfig_personal"

    # create dotfiles_old in homedir
    echo "Creating $olddir for backup of any existing dotfiles in ~"
    mkdir -p $olddir
    echo "...done"

    # change to the dotfiles directory
    echo "Changing to the $dir directory"
    cd $dir
    echo "...done"

    # move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
    for file in $files; do
      if [ -L ~/.$file ]
      then
        rm ~/.$file
      else
        mv ~/.$file $olddir/
      fi

      echo "Creating symlink to $file in home directory."
      ln -s $dir/$file ~/.$file
    done
}

case "$1" in
    link)
        link_configs
        ;;
esac
