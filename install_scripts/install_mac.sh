#!/bin/bash

# install dotfiles for mac

source ~/dotfiles_harmonised/install_scripts/install_common.sh

ln -fsn ~/dotfiles_harmonised/git/gitconfig_personal ~/.gitconfig
ln -fsn ~/dotfiles_harmonised/bash/bash_aliases_mac ~/.bash_aliases_mac
ln -fsn ~/dotfiles_harmonised/zsh/zshrc_mac ~/.zshrc
ln -fsn ~/dotfiles_harmonised/zsh/zsh_aliases_mac ~/.zsh_aliases_mac
ln -fsn ~/dotfiles_harmonised/tmux/tmux.conf ~/.tmux.conf
