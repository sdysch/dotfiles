# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

# # environment variables
# default editor
export EDITOR=vim

# taskwarrior
export TASKDIR=$HOME/.task

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# boost include directory
export BOOST_INCLUDE_DIR="/usr/local/include/"

# theme
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="powerlevel9k/powerlevel9k"


# plugins
plugins=(
	git
	tmux
	vi-mode
	zsh-syntax-highlighting
	zsh-autosuggestions
	z
)

source $ZSH/oh-my-zsh.sh

# aliases
source $HOME/.zsh_aliases
source $HOME/.zsh_aliases_mac

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh