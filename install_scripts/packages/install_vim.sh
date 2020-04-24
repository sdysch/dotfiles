#!/bin/bash
echo "Installing Vundle...."
mkdir -p ~/.config/vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo "Done"
