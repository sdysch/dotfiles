#!/bin/bash

# install dotfiles for Manchester
INSTALLDIR=$(pwd)

mkdir -p ~/.config/tmux
mkdir -p ~/.vim
mkdir -p ~/.ssh

ln -fsn ${INSTALLDIR}/config/bash/bash_aliases_manchester ~/.bash_aliases_manchester
ln -fsn ${INSTALLDIR}/config/bash/bash_profile ~/.bash_profile
ln -fsn ${INSTALLDIR}/config/git/gitconfig_personal ~/.gitconfig
ln -fsn ${INSTALLDIR}/config/git/gitignore_global ~/.gitignore_global
ln -fsn ${INSTALLDIR}/config/ssh/config ~/.ssh/config
ln -fsn ${INSTALLDIR}/config/tmux/tmux.common.conf ~/.config/tmux/common.conf
ln -fsn ${INSTALLDIR}/config/tmux/tmux.conf ~/.tmux.conf
ln -fsn ${INSTALLDIR}/config/vim/vimrc ~/.vim/vimrc
