#!/bin/bash

# make these directories so that stow does not copy everything into git repo
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/fonts
mkdir -p ~/.config
mkdir -p ~/.config/pulse
mkdir -p ~/.ssh

sudo pacman -S --needed - < packages.txt
sudo pip3 install -r python_packages.txt

stow home

# install crontab
cat crontab/crontab | crontab -

#scripts=(install_vim.sh install_fonts.sh install_zsh.sh)
#for script in ${scripts[@]}; do
	#source $script
#done
