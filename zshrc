# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sam/.oh-my-zsh"

#DEFAULT_USER=$(whoami)
#DEFAULT_USER="Sam"

# theme
#ZSH_THEME="agnoster"
# REF: https://github.com/Powerlevel9k/powerlevel9k
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user time dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1


# plugins
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
  #export EDITOR='vim'
#else
  #export EDITOR='mvim'
#fi

# common aliases
source $HOME/.zsh_aliases_common

# platform specific aliases
# personal laptop
if [[ "$(hostname)" =~ "sam-Lenovo" ]]; then
	source $HOME/.zsh_aliases_personal
fi
