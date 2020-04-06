#!/bin/bash

# link common config files
INSTALLDIR=$1

ln -fsn ${INSTALLDIR}/vim/vimrc ~/.vim/vimrc
ln -fsn ${INSTALLDIR}/bash/bash_profile ~/.bash_profile
ln -fsn ${INSTALLDIR}/git/gitignore_global ~/.gitignore_global
ln -fsn ${INSTALLDIR}/tmux/tmux.common.conf ~/.config/tmux/common.conf

mkdir -p ~/.ssh
ln -fsn ${INSTALLDIR}/ssh/config ~/.ssh/config
