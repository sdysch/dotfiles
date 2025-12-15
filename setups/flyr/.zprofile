
# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export EDITOR="nvim"

# zsh
export HISTFILE=$XDG_DATA_HOME/zsh/history
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export _Z_DATA=$XDG_DATA_HOME/z
