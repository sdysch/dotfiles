#!/bin/bash

# install dotfiles for Manchester

source ~/dotfiles_harmonised/install_scripts/install_common.sh

ln -fsn ~/dotfiles_harmonised/git/gitconfig_personal ~/.gitconfig
ln -fsn ~/dotfiles_harmonised/bash/bash_aliases_manchester ~/.bash_aliases_manchester
