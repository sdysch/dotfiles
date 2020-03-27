#!/bin/bash

# NOTE, only installs setup install_scripts/install_sam.sh (from scratch)

# Install locations
ZSH_INSTALL_DIR="~/.oh-my-zsh/custom"
VUNDLE_INSTALL_DIR="~/.vim/bundle/Vundle.vim"

#========================
#     link dotfiles
#========================

#echo "Installing config files...."
#source ~/dotfiles_harmonised/install_scripts/install_sam.sh
#echo "Done"

#=======================
#         zsh 
#=======================

# Change shell to zsh
sudo chsh -s /bin/zsh $(whoami)

# oh-my-zsh
echo "Installing oh-my-zsh"
sleep 2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# powerline fonts
echo "Installing powerline fonts...."
sleep 2
pwd=$(pwd)
# clone
git clone https://github.com/powerline/fonts.git --depth=1 /tmp
# install
cd /tmp/fonts
./install.sh
# clean-up a bit
rm -rf tmp/fonts
cd $pwd

echo "Installing zsh packages..."
sleep 2

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_INSTALL_DIR/plugins/zsh-syntax-highlighting

# zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_INSTALL_DIR/plugins/zsh-autosuggestions

#====================
#       vim
#====================

# Vundle
echo "Intalling vundle ...."
git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_INSTALL_DIR
sleep 2
vim +PluginInstall +qall

#====================
#       tmux
#====================

# themes
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack

#====================
#       i3wm
#====================

source ~/dotfiles_harmonised/install_scripts/install_i3wm.sh
