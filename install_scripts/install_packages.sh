#!/bin/bash

mkdir -p "${XDG_CONFIG_HOME:-=$HOME/.config}"
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}"

sudo apt-get install $(cat packages.txt)
pip3 install -r python_packages.txt

# install crontab
cat crontab/crontab | crontab -

scripts=(install_vim.sh install_fonts.sh install_zsh.sh)
for script in ${scripts[@]}; do
	source $script
done
