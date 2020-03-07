#!/bin/bash

# install dotfiles for lxplus

source ~/dotfiles_harmonised/install_scripts/install_common.sh

ln -fsn ~/dotfiles_harmonised/git/gitconfig_lxplus ~/.gitconfig
ln -fsn ~/dotfiles_harmonised/bash/bash_aliases_lxplus ~/.bash_aliases_lxplus
ln -fsn ~/dotfiles_harmonised/zsh/zshrc_lxplus ~/.zshrc
ln -fsn ~/dotfiles_harmonised/zsh/zsh_aliases_lxplus ~/.zsh_aliases_lxplus
ln -fsn ~/dotfiles_harmonised/tmux/tmux.lxplus.conf ~/.tmux.conf
