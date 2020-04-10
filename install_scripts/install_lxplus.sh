#!/bin/bash

# install dotfiles for lxplus
INSTALLDIR=$(pwd)

mkdir -p ~/.vim
mkdir -p ~/.config/tmux
mkdir -p ~/.ssh

ln -fsn ${INSTALLDIR}/config/bash/bash_aliases_lxplus ~/.bash_aliases_lxplus
ln -fsn ${INSTALLDIR}/config/bash/bash_profile ~/.bash_profile
ln -fsn ${INSTALLDIR}/config/git/gitconfig_lxplus ~/.gitconfig
ln -fsn ${INSTALLDIR}/config/git/gitignore_global ~/.gitignore_global
ln -fsn ${INSTALLDIR}/config/tmux/tmux.common.conf ~/.config/tmux/common.conf
ln -fsn ${INSTALLDIR}/config/tmux/tmux.lxplus.conf ~/.config/tmux/tmux.conf
ln -fsn ${INSTALLDIR}/config/vim/vimrc ~/.vim/vimrc
ln -fsn ${INSTALLDIR}/config/zsh/zsh_aliases_lxplus ~/.zsh_aliases_lxplus
ln -fsn ${INSTALLDIR}/config/zsh/zshrc_lxplus ~/.zshrc

mkdir -p ~/.ssh
ln -fsn ${INSTALLDIR}/config/ssh/config ~/.ssh/config
