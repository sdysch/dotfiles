#!/bin/bash

mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}"

# don't want to install many packages for each CI run
if [[ ! ${CI} ]]; then
	sudo apt-get install $(cat packages/packages_xubuntu.txt)
	pip3 install -r packages/python_packages.txt

	# install crontab
	cat crontab/crontab | crontab -

fi

scripts=(install_vim.sh install_fonts.sh install_zsh.sh)
for script in ${scripts[@]}; do
	source install_scripts/packages/$script
done

# don't want to install these inside CI
if [[ ! ${CI} ]]; then
	source install_scripts/packages/install_suckless.sh
fi
