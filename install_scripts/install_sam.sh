#!/bin/bash

# install everything and sym link config files to their correct locations

# installation locations
INSTALLDIR=$(pwd)

CMUSINSTALLDIR="${HOME}/.config/cmus"
I3BLOCKSINSTALLDIR="${HOME}/.config/i3blocks"
I3INSTALLDIR="${HOME}/.config/i3"
NEWSBOATINSTALLDIR="$HOME/.config/newsboat"
NITROGENINSTALLDIR="${HOME}/.config/nitrogen"
SCRIPTINSTALLDIR="${HOME}/.local/bin"
TERMINALINSTALLDIR="${HOME}/.config/xfce4/terminal"
TMUXINSTALLDIR="${HOME}/.config/tmux"
ZDOTDIR="$HOME/.config/zsh"

# make directories
mkdir -p $CMUSINSTALLDIR
mkdir -p $I3BLOCKSINSTALLDIR
mkdir -p $I3INSTALLDIR
mkdir -p $NEWSBOATINSTALLDIR
mkdir -p $NITROGENINSTALLDIR
mkdir -p $SCRIPTINSTALLDIR
mkdir -p $TERMINALINSTALLDIR
mkdir -p $TMUXINSTALLDIR
mkdir -p $ZDOTDIR


# actually install the various packages
# Order matters(?), clone taskwarrior backup before installing
# the package to prevent the directory being overwritten
if [[ "$1" == "install" ]]; then
	echo "cloning taskwarrior"
	git clone https://github.com/sdysch/taskwarrior_backups.git $HOME/.task/

	echo "Installing packages"
	source install_scripts/install_packages.sh

	# install crontab
	cat crontab/crontab | crontab -
fi

# ===== config files ========

# common install scripts
source $INSTALLDIR/install_scripts/install_common.sh $INSTALLDIR

# install dotfiles for me
ln -fsn ${INSTALLDIR}/profile $HOME/.profile
ln -fsn ${INSTALLDIR}/zprofile $HOME/.zprofile
ln -fsn ${INSTALLDIR}/zsh/zshrc_sam $ZDOTDIR/.zshrc
ln -fsn ${INSTALLDIR}/zsh/zsh_aliases_common $ZDOTDIR/.zsh_aliases_common
ln -fsn ${INSTALLDIR}/zsh/zsh_aliases_personal $ZDOTDIR/.zsh_aliases_personal
ln -fsn ${INSTALLDIR}/p10k.zsh $ZDOTDIR/.p10k.zsh
ln -fsn ${INSTALLDIR}/git/gitconfig_personal $HOME/.gitconfig
ln -fsn ${INSTALLDIR}/tmux/tmux.conf $TMUXINSTALLDIR/tmux.conf

# taskwarrior
ln -fsn ${INSTALLDIR}/taskwarrior/taskrc $TASKRC

# install i3 config
ln -fsn ${INSTALLDIR}/i3/config $I3INSTALLDIR/config
ln -fsn ${INSTALLDIR}/i3blocks/i3blocks.config $I3BLOCKSINSTALLDIR/config

# nitrogen config
ln -fsn ${INSTALLDIR}/nitrogen/nitrogen.cfg ${NITROGENINSTALLDIR}/nitrogen.cfg
ln -fsn ${INSTALLDIR}/nitrogen/bg-saved.cfg ${NITROGENINSTALLDIR}/bg-saved.cfg

# cmus
ln -fsn ${INSTALLDIR}/cmus/solarized.theme ${CMUSINSTALLDIR}/solarized.theme
ln -fsn ${INSTALLDIR}/cmus/tomorrow.theme ${CMUSINSTALLDIR}/tomorrow.theme
ln -fsn ${INSTALLDIR}/cmus/rc ${CMUSINSTALLDIR}/rc

# xfce4 config
ln -fsn ${INSTALLDIR}/xfce4/terminal/terminalrc $TERMINALINSTALLDIR/terminalrc

# newsboat
ln -fsn ${INSTALLDIR}/newsboat/config $NEWSBOATINSTALLDIR/config
ln -fsn ${INSTALLDIR}/newsboat/urls $NEWSBOATINSTALLDIR/urls

# ===== scripts ========

# link custom scripts
for file in scripts/*; do
	script=$(echo $file | sed "s/scripts\///g")
	ln -fsn ${INSTALLDIR}/scripts/$script $SCRIPTINSTALLDIR/$script
done

# link custom scripts
for file in i3blocks/scripts/*; do
	script=$(echo $file | sed "s/i3blocks\/scripts\///g")
	ln -fsn ${INSTALLDIR}/i3blocks/scripts/$script $SCRIPTINSTALLDIR/$script
done
