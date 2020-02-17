#!/bin/bash

# link common dotfiles
ln -s vimrc ~/.vimrc
ln -s bash_profile ~/.bash_profile
ln -s bash_aliases_personal ~/.bash_aliases_personal
ln -s bash_aliases_lxplus ~/.bash_aliases_lxplus
ln -s bash_aliases_mac ~/.bash_aliases_mac
ln -s gitconfig_common ~/.gitconfig_common
ln -s gitignore_global ~/.gitignore_global

# platform specific git config
# CERN config for lxplus
if [[ "$(hostname)" =~ "lxplus" ]]; then
	ln -s gitconfig_lxplus ~/.gitconfig

# personal otherwise
elif [ "$(uname)" == "Darwin" ]; then
	ln -s gitconfig_personal ~/.gitconfig
fi
