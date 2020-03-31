#!/bin/bash

# installation locations
INSTALLDIR=$(pwd)
SCRIPTINSTALLDIR="${HOME}/.local/bin"
TERMINALINSTALLDIR="${HOME}/.config/xfce4/terminal"
NITROGENINSTALLDIR="${HOME}/.config/nitrogen"
I3INSTALLDIR="${HOME}/.config/i3"
I3BLOCKSINSTALLDIR="${HOME}/.config/i3blocks"

# actually install the various packages?
if [[ "$1" == "install" ]]; then
	echo "Installing packages"
	source install_scripts/install_packages.sh
fi

# common install scripts
source $INSTALLDIR/install_scripts/install_common.sh $INSTALLDIR

# install dotfiles for me

ln -fsn ${INSTALLDIR}/git/gitconfig_personal ~/.gitconfig
ln -fsn ${INSTALLDIR}/zsh/zshrc_sam ~/.zshrc
ln -fsn ${INSTALLDIR}/zsh/zsh_aliases_personal ~/.zsh_aliases_personal
ln -fsn ${INSTALLDIR}/tmux/tmux.conf ~/.tmux.conf

# install i3 config
mkdir -p $I3INSTALLDIR
mkdir -p $I3BLOCKSINSTALLDIR
ln -fsn ${INSTALLDIR}/i3/config $I3INSTALLDIR/config
ln -fsn ${INSTALLDIR}/i3blocks/i3blocks.config $I3BLOCKSINSTALLDIR/config

# nitrogen config
mkdir -p $NITROGENINSTALLDIR
ln -fsn ${INSTALLDIR}/nitrogen/nitrogen.cfg ~/.config/nitrogen/nitrogen.cfg
ln -fsn ${INSTALLDIR}/nitrogen/bg-saved.cfg ~/.config/nitrogen/bg-saved.cfg

# installation location for custom scripts
mkdir -p $SCRIPINSTALLDIR

# link custom scripts
declare -a scripts=("shutdown_script" "reboot" "logout" "prompt" "poweroptions" "corona" "corona_formatted" "notes")
for script in ${scripts[@]}; do
	ln -fsn ${INSTALLDIR}/scripts/$script $SCRIPTINSTALLDIR/$script
done

# link custom scripts
declare -a i3blocksscripts=("battery" "bandwidth" "battery2" "bandwidth2" "memory" "cpu_usage" "wifi" "disk_usage" "keyindicator" "volume")
for script in ${i3blocksscripts[@]}; do
	ln -fsn ${INSTALLDIR}/i3blocks/scripts/$script $SCRIPTINSTALLDIR/$script
done

# xfce4 config
mkdir -p $TERMINALINSTALLDIR
ln -fsn ${INSTALLDIR}/xfce4/terminal/terminalrc $TERMINALINSTALLDIR/terminalrc
