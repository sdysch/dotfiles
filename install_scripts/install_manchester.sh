#!/bin/bash

# install dotfiles for manchester
INSTALLDIR=$(pwd)

mkdir -p ~/.config/vim
mkdir -p ~/.config/tmux
mkdir -p ~/.ssh
mkdir -p ~/.cache/zsh

ln -fsn ${INSTALLDIR}/manchester/.bashrc ~/.bashrc
ln -fsn ${INSTALLDIR}/manchester/.bash_profile ~/.bash_profile
ln -fsn ${INSTALLDIR}/manchester/.bash_prompt ~/.bash_prompt
ln -fsn ${INSTALLDIR}/manchester/.bashrc ~/.bashrc

ln -fsn ${INSTALLDIR}/manchester/.gitconfig ~/.gitconfig
ln -fsn ${INSTALLDIR}/common/git/gitignore_global ~/.gitignore_global

ln -fsn ${INSTALLDIR}/common/vim/vimrc ~/.config/vim/vimrc

ln -fsn ${INSTALLDIR}/config/ssh/config ~/.ssh/config
