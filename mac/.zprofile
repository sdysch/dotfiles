# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# === config file locations ===
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

export EDITOR="nvim"
#export EDITOR="vim"

export HISTFILE=$XDG_DATA_HOME/zsh/history
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export _Z_DATA=$XDG_DATA_HOME/z

# vim
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc
export VIMWIKI=$HOME/Documents/vimwiki

# less
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# locales for mac
export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8

# boost include directory
export BOOST_INCLUDE_DIR="/usr/local/include/"
