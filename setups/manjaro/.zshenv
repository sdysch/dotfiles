export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

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
export TERM="xterm-256color"
export TERMINAL="xfce4-terminal"

# choose status bar dependent on login session
case "$DESKTOP_SESSION" in
	i3) export STATUSBAR="i3blocks";;
	dwm) export STATUSBAR="dwmblocks";;
	*) export STATUSBAR="";;
esac

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

# less
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

# directory where wallpapers/icons are stored
export ICONSDIR="$HOME/dotfiles/icons"
export WALLPAPERSDIR="$HOME/dotfiles/wallpapers"
