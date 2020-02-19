#!/bin/bash

# common files to link for all platforms
ln -s ~/dotfiles_harmonised/vimrc ~/.vimrc
ln -s ~/dotfiles_harmonised/bash_profile ~/.bash_profile
ln -s ~/dotfiles_harmonised/gitignore_global ~/.gitignore_global

# common zsh aliases
ln -s ~/dotfiles_harmonised/zsh_aliases_common ~/.zsh_aliases_common

# platform specific files to link
# CERN config for lxplus
if [[ "$(hostname)" =~ "lxplus" ]]; then
	# git
	ln -s ~/dotfiles_harmonised/gitconfig_lxplus ~/.gitconfig
	# lxplus aliases
	ln -s ~/dotfiles_harmonised/bash_aliases_lxplus ~/.bash_aliases_lxplus

	# zshrc for lxplus
	ln -s ~/dotfiles_harmonised/zshrc_lxplus ~/.zshrc

# mac
elif [ "$(uname)" == "Darwin" ]; then
	# git
	ln -s ~/dotfiles_harmonised/gitconfig_personal ~/.gitconfig

	# mac aliases
	ln -s ~/dotfiles_harmonised/bash_aliases_mac ~/.bash_aliases_mac

# personal laptop
elif [[ "$(hostname)" =~ "sam-Lenovo" ]]; then
	# git
	ln -s ~/dotfiles_harmonised/gitconfig_personal ~/.gitconfig
	ln -s ~/dotfiles_harmonised/zshrc_sam ~/.zshrc

	# personal aliases
	ln -s ~/dotfiles_harmonised/bashrc ~/.bashrc
	ln -s ~/dotfiles_harmonised/bash_aliases_sam ~/.bash_aliases_sam

	# zsh
	ln -s ~/dotfiles_harmonised/zsh_aliases_personal ~/.zsh_aliases_personal

# Manchester
elif [[ "$(hostname)" =~ "hep.manchester.ac.uk" ]]; then
	# git
	ln -s ~/dotfiles_harmonised/gitconfig_personal ~/.gitconfig

	# any Manchester aliases
	ln -s ~/dotfiles_harmonised/bash_aliases_manchester ~/.bash_aliases_manchester
fi
