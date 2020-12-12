# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

# run as non-login shell, these are copy pasted from home/.profile (repo)
# # environment variables
# default editor
#export EDITOR=vim
export EDITOR=nvim
alias vim="nvim"

# === config file locations ===
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

# boost include directory
export BOOST_INCLUDE_DIR="/usr/local/include/"

# zsh plugins
ZSH_PLUGINS=${XDG_DATA_HOME:-$HOME/.local/share}/zsh_plugins
source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $ZSH_PLUGINS/powerlevel10k/powerlevel10k.zsh-theme
source $ZSH_PLUGINS/z/z.sh

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# prompt
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# change colour of wildcard
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold

# zsh
export HISTFILE=$XDG_DATA_HOME/zsh/history
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export _Z_DATA=$XDG_DATA_HOME/z

# vim
export VIMINIT=":source $XDG_CONFIG_HOME"/vim/vimrc

# locales for mac
export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8

# aliases
source $HOME/.zsh_aliases

# Add my scripts to PATH
export PATH=$PATH:$HOME/.local/bin
