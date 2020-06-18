#!/bin/bash

mkdir -p ~/.local/bin
mkdir -p ~/.local/share

pacman -S --needed - < packages.txt
pip3 install -r python_packages.txt

stow home

#echo "cloning taskwarrior"
#mkdir -p $HOME/.task
#git clone https://github.com/sdysch/taskwarrior_backups.git $HOME/.task/

# install crontab
cat crontab/crontab | crontab -

#scripts=(install_vim.sh install_fonts.sh install_zsh.sh)
#for script in ${scripts[@]}; do
	#source $script
#done

#source install_scripts/packages/install_tmux.sh
