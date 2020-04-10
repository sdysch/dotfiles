#!/bin/bash

# === install everything and sym link config files to their correct locations ====
# TODO - need a better way to manage dotfiles for multiple computers???
# This works, for now, so why change it?

#  ===== installation locations =====
INSTALLDIR=$(pwd)

#TODO - use $XDG_CONFIG_HOME??
CMUSINSTALLDIR="${HOME}/.config/cmus"
DUNSTINSTALLDIR="${HOME}/.config/dunst"
I3BLOCKSINSTALLDIR="${HOME}/.config/i3blocks"
I3INSTALLDIR="${HOME}/.config/i3"
NEWSBOATINSTALLDIR="$HOME/.config/newsboat"
NITROGENINSTALLDIR="${HOME}/.config/nitrogen"
SCRIPTINSTALLDIR="${HOME}/.local/bin"
SSHINSTALLDIR="$HOME/.ssh"
TERMINALINSTALLDIR="${HOME}/.config/xfce4/terminal"
TMUXINSTALLDIR="${HOME}/.config/tmux"
VIMINSTALLDIR=$HOME/.vim
ZDOTDIR="$HOME/.config/zsh"
ZATHURAINSTALLDIR="$HOME/.config/zathura"
MUTTINSTALLDIR="$HOME/.config/mutt"

# ==== make directories ====
mkdir -p $CMUSINSTALLDIR
mkdir -p $DUNSTINSTALLDIR
mkdir -p $I3BLOCKSINSTALLDIR
mkdir -p $I3INSTALLDIR
mkdir -p $NEWSBOATINSTALLDIR
mkdir -p $NITROGENINSTALLDIR
mkdir -p $SCRIPTINSTALLDIR
mkdir -p $SSHINSTALLDIR
mkdir -p $TERMINALINSTALLDIR
mkdir -p $TMUXINSTALLDIR
mkdir -p $VIMINSTALLDIR
mkdir -p $ZDOTDIR
mkdir -p $ZATHURAINSTALLDIR
mkdir -p $MUTTINSTALLDIR



#====================================================================================================================================================================================================================================================


#  ===== actually install the various packages =====
# Order matters(?), clone my taskwarrior backup before installing taskwarrior to prevent the directory being overwritten

if [[ "$1" == "install" ]]; then
	echo "cloning taskwarrior"
	git clone https://github.com/sdysch/taskwarrior_backups.git $HOME/.task/

	echo "Installing packages"
	source install_scripts/packages/install_packages.sh

	# install crontab
	cat crontab/crontab | crontab -
fi

#====================================================================================================================================================================================================================================================

# ===== config files ========

# === git ===
ln -fsn ${INSTALLDIR}/config/git/gitconfig_personal $HOME/.gitconfig
ln -fsn ${INSTALLDIR}/config/git/gitignore_global $HOME/.gitignore_global

# ==== zsh ====
ln -fsn ${INSTALLDIR}/config/zsh/p10k.zsh $ZDOTDIR/.p10k.zsh
ln -fsn ${INSTALLDIR}/zprofile $HOME/.zprofile
ln -fsn ${INSTALLDIR}/config/zsh/zsh_aliases_common $ZDOTDIR/.zsh_aliases_common
ln -fsn ${INSTALLDIR}/config/zsh/zsh_aliases_personal $ZDOTDIR/.zsh_aliases_personal
ln -fsn ${INSTALLDIR}/config/zsh/zshrc_sam $ZDOTDIR/.zshrc

# ==== profile =====
ln -fsn ${INSTALLDIR}/profile $HOME/.profile

# ===== ssh =====
ln -fsn ${INSTALLDIR}/config/ssh/config $HOME/.ssh/config

# ==== tmux ====
ln -fsn ${INSTALLDIR}/config/tmux/tmux.common.conf $TMUXINSTALLDIR/common.conf
ln -fsn ${INSTALLDIR}/config/tmux/tmux.conf $TMUXINSTALLDIR/tmux.conf

# ==== vim ====
ln -fsn ${INSTALLDIR}/config/vim/vimrc $VIMINSTALLDIR/vimrc

# ===== taskwarrior =====
ln -fsn ${INSTALLDIR}/config/taskwarrior/taskrc $TASKRC

# NOTE, i3 is installed with a separate script (see docs/i3)
# ===== i3 config =====
ln -fsn ${INSTALLDIR}/config/i3/config $I3INSTALLDIR/config
ln -fsn ${INSTALLDIR}/config/i3blocks/i3blocks.config $I3BLOCKSINSTALLDIR/config

# ==== nitrogen config =====
ln -fsn ${INSTALLDIR}/config/nitrogen/nitrogen.cfg ${NITROGENINSTALLDIR}/nitrogen.cfg
ln -fsn ${INSTALLDIR}/config/nitrogen/bg-saved.cfg ${NITROGENINSTALLDIR}/bg-saved.cfg

# ===== cmus =====
ln -fsn ${INSTALLDIR}/config/cmus/solarized.theme ${CMUSINSTALLDIR}/solarized.theme
ln -fsn ${INSTALLDIR}/config/cmus/tomorrow.theme ${CMUSINSTALLDIR}/tomorrow.theme
ln -fsn ${INSTALLDIR}/config/cmus/rc ${CMUSINSTALLDIR}/rc
ln -fsn ${INSTALLDIR}/config/cmus/status_display_program.sh ${CMUSINSTALLDIR}/status_display_program.sh

# ====== xfce4 terminal =====
ln -fsn ${INSTALLDIR}/config/xfce4/terminal/terminalrc $TERMINALINSTALLDIR/terminalrc

# ===== newsboat =====
ln -fsn ${INSTALLDIR}/config/newsboat/config $NEWSBOATINSTALLDIR/config
ln -fsn ${INSTALLDIR}/config/newsboat/urls $NEWSBOATINSTALLDIR/urls

# ====== zathura =======
ln -fsn ${INSTALLDIR}/config/zathura/zathurarc $ZATHURAINSTALLDIR/zathurarc

# ======= mutt =======
ln -fsn $INSTALLDIR/config/mutt/signature $MUTTINSTALLDIR/signature
ln -fsn $INSTALLDIR/config/mutt/config.muttrc $MUTTINSTALLDIR/config.muttrc

# ===== default applications =====
ln -fsn ${INSTALLDIR}/config/mimeapps.list $XDG_CONFIG_HOME/mimeapps.list

# ===== scripts (to be added to path) ========

# ====== link custom scripts =======
for file in $INSTALLDIR/scripts/*; do
	ln -fsn $file $SCRIPTINSTALLDIR
done

# ===== i3blocks scripts ======
for file in $INSTALLDIR/config/i3blocks/scripts/*; do
	ln -fsn $file $SCRIPTINSTALLDIR
done
