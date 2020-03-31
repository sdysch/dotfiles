#!/bin/bash

INSTALLDIR=$(pwd)

# actually install the various packages?
if [[ "$1" == "install" ]]; then
	echo "Installing packages"
	source install_scripts/install_packages.sh
fi

# common install scripts
source $INSTALLDIR/install_scripts/install_common.sh $INSTALLDIR

# install dotfiles for me

ln -fsn ~/dotfiles_harmonised/git/gitconfig_personal ~/.gitconfig
#ln -fsn ~/dotfiles_harmonised/bash/bashrc ~/.bashrc
#ln -fsn ~/dotfiles_harmonised/bash/bash_aliases_sam ~/.bash_aliases_sam
ln -fsn ~/dotfiles_harmonised/zsh/zshrc_sam ~/.zshrc
ln -fsn ~/dotfiles_harmonised/zsh/zsh_aliases_personal ~/.zsh_aliases_personal
ln -fsn ~/dotfiles_harmonised/tmux/tmux.conf ~/.tmux.conf

# install i3 config
mkdir -p ~/.config/i3
mkdir -p ~/.config/i3blocks
ln -fsn ~/dotfiles_harmonised/i3/config ~/.config/i3/config
#ln -fsn ~/dotfiles_harmonised/i3/i3status.conf ~/.config/i3/i3status.conf
ln -fsn ~/dotfiles_harmonised/i3blocks/i3blocks.config ~/.config/i3blocks/config

# nitrogen config
mkdir -p ~/.config/nitrogen
ln -fsn ~/dotfiles_harmonised/nitrogen/nitrogen.cfg ~/.config/nitrogen/nitrogen.cfg
ln -fsn ~/dotfiles_harmonised/nitrogen/bg-saved.cfg ~/.config/nitrogen/bg-saved.cfg

# link custom scripts
declare -a scripts=("shutdown_script" "reboot" "logout" "prompt" "poweroptions" "corona" "corona_formatted" "notes")
for script in ${scripts[@]}; do
	ln -fsn ~/dotfiles_harmonised/scripts/$script ~/.local/bin/$script
done

# link custom scripts
declare -a i3blocksscripts=("battery" "bandwidth" "battery2" "bandwidth2" "memory" "cpu_usage" "wifi" "disk_usage" "keyindicator" "volume")
for script in ${i3blocksscripts[@]}; do
	ln -fsn ~/dotfiles_harmonised/i3blocks/scripts/$script ~/.local/bin/$script
done

# xfce4 config
ln -fsn ~/dotfiles_harmonised/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc
