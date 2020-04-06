#!/bin/bash

# install dotfiles for lxplus
INSTALLDIR=$(pwd)

mkdir -p ~/.vim
mkdir -p ~/.config/tmux
ln -fsn ${INSTALLDIR}/bash/bash_aliases_lxplus ~/.bash_aliases_lxplus
ln -fsn ${INSTALLDIR}/bash/bash_profile ~/.bash_profile
ln -fsn ${INSTALLDIR}/git/gitconfig_lxplus ~/.gitconfig
ln -fsn ${INSTALLDIR}/git/gitignore_global ~/.gitignore_global
ln -fsn ${INSTALLDIR}/tmux/tmux.common.conf ~/.config/tmux/common.conf
ln -fsn ${INSTALLDIR}/tmux/tmux.lxplus.conf ~/.config/tmux/tmux.conf
ln -fsn ${INSTALLDIR}/vim/vimrc ~/.vim/vimrc
ln -fsn ${INSTALLDIR}/zsh/zsh_aliases_lxplus ~/.zsh_aliases_lxplus
ln -fsn ${INSTALLDIR}/zsh/zshrc_lxplus ~/.zshrc

mkdir -p ~/.ssh
ln -fsn ${INSTALLDIR}/ssh/config ~/.ssh/config
