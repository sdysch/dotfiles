#!/bin/bash

# install dotfiles for lxplus
INSTALLDIR=$(pwd)

source ${INSTALLDIR}/install_scripts/install_common.sh $INSTALLDIR

ln -fsn ${INSTALLDIR}/git/gitconfig_lxplus ~/.gitconfig
ln -fsn ${INSTALLDIR}/bash/bash_aliases_lxplus ~/.bash_aliases_lxplus
ln -fsn ${INSTALLDIR}/zsh/zshrc_lxplus ~/.zshrc
ln -fsn ${INSTALLDIR}/zsh/zsh_aliases_lxplus ~/.zsh_aliases_lxplus
ln -fsn ${INSTALLDIR}/tmux/tmux.lxplus.conf ~/.tmux.conf
