# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh


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

# enable vi mode
bindkey -v

# setup autocompletion
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# common aliases
source $ZDOTDIR/.zsh_aliases

# change colour of wildcard
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
