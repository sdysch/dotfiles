
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
# export FZF_DEFAULT_OPTS="--color 16 --layout=reverse --height 60% --preview='bat -p --color=always {}' --border=rounded --style=minimal"
if command -v bat &>/dev/null; then
    FZF_PREVIEW='bat -p --color=always {}'
else
    FZF_PREVIEW='cat {}'
fi
export FZF_DEFAULT_OPTS='
--color=fg:#D8DEE9,fg+:#E5E9F0,bg:#2E3440,bg+:#3B4252
--color=hl:#88C0D0,hl+:#81A1C1,info:#EBCB8B,marker:#A3BE8C
--color=prompt:#BF616A,spinner:#B48EAD,pointer:#8FBCBB,header:#81A1C1
--color=border:#3B4252,label:#D8DEE9,query:#E5E9F0
--layout=reverse
--height=60%
--preview="$FZF_PREVIEW"
--border=rounded
--border-label=""
--preview-window="border-rounded"
--prompt="> "
--marker=">"
--pointer="◆"
--separator="─"
--scrollbar="│"
'

# coder specifics that can be flaky
[[ $(uname) = "Darwin" ]] && export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --style=minimal"

# ripgrep
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config

# less
export LESS='-FRX'
