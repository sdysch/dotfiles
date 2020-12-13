# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

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

# enable ctrl a/e to jump to beginning/end of line
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# enable vi mode
bindkey -v

# prompt
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# change colour of wildcard
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold

# setup autocompletion
autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# save history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=$HISTFILE

# aliases
source $ZDOTDIR/.zsh_aliases
