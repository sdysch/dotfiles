#!/bin/bash

# install dotfiles for my laptop

# these are the same across all machines
ln -fsn ~/dotfiles_harmonised/vim/vimrc ~/.vimrc
ln -fsn ~/dotfiles_harmonised/bash/bash_profile ~/.bash_profile
ln -fsn ~/dotfiles_harmonised/git/gitignore_global ~/.gitignore_global
ln -fsn ~/dotfiles_harmonised/zsh/zsh_aliases_common ~/.zsh_aliases_common

ln -fsn ~/dotfiles_harmonised/git/gitconfig_personal ~/.gitconfig
ln -fsn ~/dotfiles_harmonised/bash/bashrc ~/.bashrc
ln -fsn ~/dotfiles_harmonised/bash/bash_aliases_sam ~/.bash_aliases_sam
ln -fsn ~/dotfiles_harmonised/zsh/zshrc_sam ~/.zshrc
ln -fsn ~/dotfiles_harmonised/zsh/zsh_aliases_personal ~/.zsh_aliases_personal
