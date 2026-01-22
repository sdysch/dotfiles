
# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Add gcloud to path
if [ -d "$HOME/google-cloud-sdk/bin" ] ; then
	export PATH=$PATH:"$HOME/google-cloud-sdk/bin"
fi

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export EDITOR="nvim"

# zsh
export HISTFILE=$XDG_DATA_HOME/zsh/history
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export _Z_DATA=$XDG_DATA_HOME/z

# python
export PYTHONBREAKPOINT=pdbpp.set_trace

# FZF
export FZF_DEFAULT_OPTS="--color 16 --layout=reverse --height 60% --border=rounded"
# coder specifics that can be flaky
command -v 'bat' > /dev/null && export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview='bat -p --color=always {}'"
[[ $(uname) = "Darwin" ]] && export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --style=minimal"

# less
export LESS='-FRX'
