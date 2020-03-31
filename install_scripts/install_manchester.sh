#!/bin/bash

# install dotfiles for Manchester
INSTALLDIR=$(pwd)

source ${INSTALLDIR}/install_scripts/install_common.sh $INSTALLDIR

ln -fsn ${INSTALLDIR}/git/gitconfig_personal ~/.gitconfig
ln -fsn ${INSTALLDIR}/bash/bash_aliases_manchester ~/.bash_aliases_manchester
ln -fsn ${INSTALLDIR}/tmux/tmux.conf ~/.tmux.conf
