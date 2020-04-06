#!/bin/bash

# install dotfiles for mac
INSTALLDIR=$(pwd)

mkdir -p ~/.ssh
mkdir -p ~/.config/tmux

ln -fsn ${INSTALLDIR}/bash/bash_aliases_mac ~/.bash_aliases_mac
ln -fsn ${INSTALLDIR}/bash/bash_profile ~/.bash_profile
ln -fsn ${INSTALLDIR}/git/gitconfig_personal ~/.gitconfig
ln -fsn ${INSTALLDIR}/git/gitignore_global ~/.gitignore_global
ln -fsn ${INSTALLDIR}/p10k.zsh ~/.p10k.zsh
ln -fsn ${INSTALLDIR}/ssh/config ~/.ssh/config
ln -fsn ${INSTALLDIR}/tmux/tmux.common.conf ~/.config/tmux/common.conf
ln -fsn ${INSTALLDIR}/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
ln -fsn ${INSTALLDIR}/vim/vimrc ~/.vim/vimrc
ln -fsn ${INSTALLDIR}/zsh/zsh_aliases_common ~/.zsh_aliases_common
ln -fsn ${INSTALLDIR}/zsh/zsh_aliases_mac ~/.zsh_aliases_mac
ln -fsn ${INSTALLDIR}/zsh/zshrc_mac ~/.zshrc
