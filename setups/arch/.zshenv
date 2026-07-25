# Sourced for all shell invocations (login, interactive, scripts).
# Keep this minimal — only things that must be available everywhere.

# === XDG base directories ===
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# === PATH ===
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# add doom emacs to PATH
EMACS_DIR=$XDG_CONFIG_HOME/emacs
[[ -d $EMACS_DIR/bin ]] && export PATH="$EMACS_DIR/bin:$PATH"

# zsh — ZDOTDIR must be set early so zsh finds .zshrc/.zprofile in the right place
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
