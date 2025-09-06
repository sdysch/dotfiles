#!/bin/sh

mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}"
mkdir -p "${XDG_CACHE_HOME:-$HOME/.cache}"
mkdir -p $HOME/.ssh

# don't want to install many packages for each CI run
# they are also not needed for the docker container
if [[ ! ${CI} ]] ; then
	sudo pacman -S --needed - < packages_arch.txt

	# install crontab
	systemctl enable cronie
	cat crontab/crontab_arch | crontab -

	# AUR
	pushd /tmp
	git clone https://aur.archlinux.org/yay-git.git
	cd yay-git
	makepkg -si
	popd

	yay -S --needed - < packages_AUR.txt

fi


scripts=(fonts zsh vim)
for script in ${scripts[@]}; do
	source install_scripts/packages/"install_${script}.sh"
done

# create a place to put desktop session entry for dwm
sudo mkdir -p /usr/share/xsessions
source install_scripts/packages/install_suckless.sh

# enable login manager
if [[ ! ${CI} ]] ; then
	systemctl enable lightdm.service
fi
