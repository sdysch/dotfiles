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

# === config file locations ===
# TODO, replace hardcoded $HOME/.config with $XDG_CONFIG_HOME
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# ==== environment variables ====

# ==== dotfiles ====
export ZDOTDIR=$HOME/.config/zsh
export _Z_DATA=$HOME/.local/share/z

# ==== programs ====
# default editor
export EDITOR=vim

# image viewer
export IMAGEVIEWER="ristretto"

# status bar
export STATUSBAR="i3blocks"

# terminal
export TERM="xterm-256color"
export TERMINAL="xfce4-terminal"

export PROMPT_EOL_MARK=""


# taskwarrior
export TASKDATA=$HOME/.config/task
export TASKRC=$HOME/.config/task/taskrc

# thesis
export thesisDir="$HOME/Documents/Manchester/PhD/thesis"

# to do list
export TODOLISTDIR="$HOME/.config/todolist"
export PATH=$PATH:"${TODOLISTDIR}/scripts"

# to do list backup (repo is private from git)
export TODOBACKUP="$HOME/Documents/todolist-backup"
export PATH=$PATH:"${TODOBACKUP}/scripts"

# directory where wallpapers/icons are stored
export ICONSDIR="$HOME/dotfiles_harmonised/icons"
export WALLPAPERSDIR="$HOME/dotfiles_harmonised/wallpapers"
