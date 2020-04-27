# vim: ft=sh
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# This file is run upon login

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# default programs
export EDITOR="nvim"
#export EDITOR="vim"
export IMAGEVIEWER="ristretto"
export READER="zathura"
export STATUSBAR="i3blocks"
export TERM="xterm-256color"
export TERMINAL="xfce4-terminal"

# === config file locations ===
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

# === config file locations ===

# my location
export LOCATION="Manchester"

# zsh
export HISTFILE=$XDG_DATA_HOME/zsh/history
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export _Z_DATA=$XDG_DATA_HOME/z

# gnupg & pass
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/password-store

# notmuch
export NOTMUCH_CONFIG=$XDG_CONFIG_HOME/notmuch/notmuchrc

# ICE authority
export ICEAUTHORITY=$XDG_CACHE_HOME/ICEauthority

# vim
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc

# calcurse
export CALCURSECONFIG=$XDG_CONFIG_HOME/calcurse

export PROMPT_EOL_MARK=""

# taskwarrior
export TASKDATA=$XDG_CONFIG_HOME/task
export TASKRC=$XDG_CONFIG_HOME/taskwarrior/.taskrc

# less
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# directory where wallpapers/icons are stored
export ICONSDIR="$HOME/dotfiles_harmonised/icons"
export WALLPAPERSDIR="$HOME/dotfiles_harmonised/wallpapers"

# thesis
export thesisDir="$HOME/Documents/Manchester/PhD/thesis"

# to do list
export TODOLISTDIR="$XDG_CONFIG_HOME/todolist"
export PATH=$PATH:"${TODOLISTDIR}/scripts"
export TODOBACKUP="$HOME/Documents/todolist-backup"
export PATH=$PATH:"${TODOBACKUP}/scripts"
