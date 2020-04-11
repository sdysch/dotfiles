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

# my location
export LOCATION="Manchester"

# === config file locations ===
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# ==== environment variables ====

# ==== dotfiles ====
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
export HISTFILE=$XDG_CONFIG_HOME/zsh/history
export NOTMUCH_CONFIG=$XDG_CONFIG_HOME/notmuch/notmuchrc
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export _Z_DATA=$XDG_DATA_HOME/z
export PASSWORD_STORE_DIR=$HOME/.password-store

# ==== programs ====

# default programs
export EDITOR="vim"
export IMAGEVIEWER="ristretto"
export READER="zathura"
export STATUSBAR="i3blocks"
export TERM="xterm-256color"
export TERMINAL="xfce4-terminal"

# calcurse
export CALCURSECONFIG=$XDG_CONFIG_HOME/calcurse
export PROMPT_EOL_MARK=""

# taskwarrior
export TASKDATA=$XDG_CONFIG_HOME/task
export TASKRC=$XDG_CONFIG_HOME/taskwarrior/.taskrc

# ==== personal ====

# directory where wallpapers/icons are stored
export ICONSDIR="$HOME/dotfiles_harmonised/icons"
export WALLPAPERSDIR="$HOME/dotfiles_harmonised/wallpapers"

# thesis
export thesisDir="$HOME/Documents/Manchester/PhD/thesis"

# to do list
export TODOLISTDIR="$XDG_CONFIG_HOME/todolist"
export PATH=$PATH:"${TODOLISTDIR}/scripts"

# to do list backup (repo is private from git)
export TODOBACKUP="$HOME/Documents/todolist-backup"
export PATH=$PATH:"${TODOBACKUP}/scripts"