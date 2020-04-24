#!/bin/bash

# install dotfiles for lxplus
INSTALLDIR=$(pwd)

mkdir -p ~/.config/vim
mkdir -p ~/.config/tmux
mkdir -p ~/.ssh

ln -fsn ${INSTALLDIR}/common/bash/bash_aliases_lxplus ~/.bash_aliases
ln -fsn ${INSTALLDIR}/common/bash/bash_profile ~/.bash_profile
ln -fsn ${INSTALLDIR}/common/git/gitconfig_lxplus ~/.gitconfig
ln -fsn ${INSTALLDIR}/common/git/gitignore_global ~/.gitignore_global
#ln -fsn ${INSTALLDIR}/common/tmux/tmux.common.conf ~/.config/tmux/common.conf
#ln -fsn ${INSTALLDIR}/common/tmux/tmux.lxplus.conf ~/.config/tmux/tmux.conf
ln -fsn ${INSTALLDIR}/common/vim/vimrc ~/.config/vim/vimrc

# do not use zsh on lxplus - xTauFW is not compatible?
#ln -fsn ${INSTALLDIR}/common/zsh/zsh_aliases_lxplus ~/.zsh_aliases_lxplus
#ln -fsn ${INSTALLDIR}/common/zsh/zshrc_lxplus ~/.zshrc

mkdir -p ~/.ssh
ln -fsn ${INSTALLDIR}/config/ssh/config ~/.ssh/config
