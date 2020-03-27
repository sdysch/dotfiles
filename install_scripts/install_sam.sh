#!/bin/bash

# common install scripts
source ~/dotfiles_harmonised/install_scripts/install_common.sh

# install dotfiles for me

ln -fsn ~/dotfiles_harmonised/git/gitconfig_personal ~/.gitconfig
#ln -fsn ~/dotfiles_harmonised/bash/bashrc ~/.bashrc
#ln -fsn ~/dotfiles_harmonised/bash/bash_aliases_sam ~/.bash_aliases_sam
ln -fsn ~/dotfiles_harmonised/zsh/zshrc_sam ~/.zshrc
ln -fsn ~/dotfiles_harmonised/zsh/zsh_aliases_personal ~/.zsh_aliases_personal
ln -fsn ~/dotfiles_harmonised/tmux/tmux.conf ~/.tmux.conf

# install i3 config
mkdir -p ~/.i3
ln -fsn ~/dotfiles_harmonised/i3/config ~/.i3/config
ln -fsn ~/dotfiles_harmonised/i3/i3status.conf ~/.i3/i3status.conf
ln -fsn ~/dotfiles_harmonised/i3/i3blocks.config ~/.config/i3blocks/config

# nitrogen config
mkdir -p ~/.config/nitrogen
ln -fsn ~/dotfiles_harmonised/config/nitrogen/nitrogen.cfg ~/.config/nitrogen/nitrogen.cfg
ln -fsn ~/dotfiles_harmonised/config/nitrogen/bg-saved.cfg ~/.config/nitrogen/bg-saved.cfg
