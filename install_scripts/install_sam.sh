#!/bin/bash

# install dotfiles for me

ln -fsn ~/dotfiles_harmonised/git/gitconfig_personal ~/.gitconfig
ln -fsn ~/dotfiles_harmonised/bash/bashrc ~/.bashrc
ln -fsn ~/dotfiles_harmonised/bash/bash_aliases_sam ~/.bash_aliases_sam
ln -fsn ~/dotfiles_harmonised/zsh/zshrc_sam ~/.zshrc
ln -fsn ~/dotfiles_harmonised/zsh/zsh_aliases_personal ~/.zsh_aliases_personal
ln -fsn ~/dotfiles_harmonised/tmux/tmux.conf ~/.tmux.conf

# install i3 config
mkdir -p ~/.i3
ln -fsn ~/dotfiles_harmonised/i3/config ~/.i3/config
ln -fsn ~/dotfiles_harmonised/i3/i3status.conf ~/.i3/i3status.conf
