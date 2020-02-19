# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sam/.oh-my-zsh"

# theme
ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="awesomepanda"

export DEFAULT_USER="Sam"

# plugins
plugins=(
	git
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

source $HOME/.zsh_aliases_common
