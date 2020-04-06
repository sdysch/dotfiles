#!/bin/bash

# install dotfiles for mac
INSTALLDIR=$(pwd)

source ${INSTALLDIR}/install_scripts/install_common.sh $INSTALLDIR

ln -fsn ${INSTALLDIR}/git/gitconfig_personal ~/.gitconfig
ln -fsn ${INSTALLDIR}/bash/bash_aliases_mac ~/.bash_aliases_mac
ln -fsn ${INSTALLDIR}/zsh/zshrc_mac ~/.zshrc
ln -fsn ${INSTALLDIR}/zsh/zsh_aliases_common ~/.zsh_aliases_common
ln -fsn ${INSTALLDIR}/zsh/zsh_aliases_mac ~/.zsh_aliases_mac
ln -fsn ${INSTALLDIR}/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
ln -fsn ${INSTALLDIR}/p10k.zsh ~/.p10k.zsh
