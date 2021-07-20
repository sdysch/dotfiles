#!/bin/bash
echo "Installing Vundle...."
INSTALLDIR=${XDG_DATA_HOME:-$HOME/.local/share}/vim/bundle
mkdir -p $INSTALLDIR
git clone https://github.com/VundleVim/Vundle.vim.git $INSTALLDIR/Vundle.vim
vim +PluginInstall +qall
echo "Done"
