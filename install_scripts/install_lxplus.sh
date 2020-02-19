#!/bin/bash

# install dotfiles for lxplus

# these are the same across all machines
ln -fsn ~/dotfiles_harmonised/vim/vimrc ~/.vimrc
ln -fsn ~/dotfiles_harmonised/bash/bash_profile ~/.bash_profile
ln -fsn ~/dotfiles_harmonised/git/gitignore_global ~/.gitignore_global
ln -fsn ~/dotfiles_harmonised/zsh/zsh_aliases_common ~/.zsh_aliases_common

# lxplus specific
ln -fsn ~/dotfiles_harmonised/git/gitconfig_lxplus ~/.gitconfig
ln -fsn ~/dotfiles_harmonised/bash/bash_aliases_lxplus ~/.bash_aliases_lxplus
ln -fsn ~/dotfiles_harmonised/zsh/zshrc_lxplus ~/.zshrc
