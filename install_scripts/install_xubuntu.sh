#!/bin/bash

mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}"

# don't want to install many packages for each CI run
# they are also not needed for the docker container
if [[ ! ${CI} ]]; then
	sudo apt-get install $(cat packages/packages_xubuntu.txt)
	pip3 install -r packages/python_packages.txt

	# install crontab
	cat crontab/crontab | crontab -

fi


[[ $DOCKER = "yes" ]] && alias vim="nvim"

scripts=(vim fonts zsh)
for script in ${scripts[@]}; do
	source install_scripts/packages/"install_${script}.sh"
done

# don't want to install these inside CI
if [[ ! ${CI} ]]; then

	# use sed to replace ssh with https, because we don't have access to ssh keys inside docker container
	if [[ $DOCKER = "yes" ]]; then
		sed -i 's/git@github.com:/https:\/\/github.com\//' install_scripts/packages/install_suckless.sh

		# create a place to put desktop session entry for dwm
		sudo mkdir -p /usr/share/xsessions
	fi

	source install_scripts/packages/install_suckless.sh
fi
