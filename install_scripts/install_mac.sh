#!/bin/bash

# install dotfiles for mac
INSTALLDIR=$(pwd)

mkdir -p ~/.ssh
mkdir -p ~/.config/tmux
mkdir -p ~/.vim

ln -fsn ${INSTALLDIR}/config/bash/bash_aliases_mac ~/.bash_aliases_mac
ln -fsn ${INSTALLDIR}/config/bash/bash_profile ~/.bash_profile
ln -fsn ${INSTALLDIR}/config/git/gitconfig_personal ~/.gitconfig
ln -fsn ${INSTALLDIR}/config/git/gitignore_global ~/.gitignore_global
ln -fsn ${INSTALLDIR}/config/zsh/p10k.zsh ~/.p10k.zsh
ln -fsn ${INSTALLDIR}/config/ssh/config ~/.ssh/config
ln -fsn ${INSTALLDIR}/config/tmux/tmux.common.conf ~/.config/tmux/common.conf
ln -fsn ${INSTALLDIR}/config/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
ln -fsn ${INSTALLDIR}/config/vim/vimrc ~/.vim/vimrc
ln -fsn ${INSTALLDIR}/config/zsh/zsh_aliases_common ~/.zsh_aliases_common
ln -fsn ${INSTALLDIR}/config/zsh/zsh_aliases_mac ~/.zsh_aliases_mac
ln -fsn ${INSTALLDIR}/config/zsh/zshrc_mac ~/.zshrc
