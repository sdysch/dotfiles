#!/bin/bash

# install dotfiles for Manchester
INSTALLDIR=$(pwd)

mkdir -p ~/.config/tmux
mkdir -p ~/.vim
mkdir -p ~/.ssh

ln -fsn ${INSTALLDIR}/bash/bash_aliases_manchester ~/.bash_aliases_manchester
ln -fsn ${INSTALLDIR}/bash/bash_profile ~/.bash_profile
ln -fsn ${INSTALLDIR}/git/gitconfig_personal ~/.gitconfig
ln -fsn ${INSTALLDIR}/git/gitignore_global ~/.gitignore_global
ln -fsn ${INSTALLDIR}/ssh/config ~/.ssh/config
ln -fsn ${INSTALLDIR}/tmux/tmux.common.conf ~/.config/tmux/common.conf
ln -fsn ${INSTALLDIR}/tmux/tmux.conf ~/.tmux.conf
ln -fsn ${INSTALLDIR}/vim/vimrc ~/.vim/vimrc
