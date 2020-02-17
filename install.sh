#!/bin/bash

# link common dotfiles
ln -s ~/dotfiles_harmonised/vimrc ~/.vimrc
ln -s ~/dotfiles_harmonised/bash_profile ~/.bash_profile
ln -s ~/dotfiles_harmonised/bash_aliases_personal ~/.bash_aliases_personal
ln -s ~/dotfiles_harmonised/bash_aliases_lxplus ~/.bash_aliases_lxplus
ln -s ~/dotfiles_harmonised/bash_aliases_mac ~/.bash_aliases_mac
ln -s ~/dotfiles_harmonised/gitconfig_common ~/.gitconfig_common
ln -s ~/dotfiles_harmonised/gitignore_global ~/.gitignore_global

# platform specific git config
# CERN config for lxplus
if [[ "$(hostname)" =~ "lxplus" ]]; then
	ln -s ~/dotfiles_harmonised/gitconfig_lxplus ~/.gitconfig

# personal otherwise
elif [ "$(uname)" == "Darwin" ]; then
	ln -s ~/dotfiles_harmonised/gitconfig_personal ~/.gitconfig
fi
