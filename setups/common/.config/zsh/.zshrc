# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh


# zsh plugins
ZSH_PLUGINS=${XDG_DATA_HOME:-$HOME/.local/share}/zsh_plugins

#  powerlevel10k/powerlevel10k.zsh-theme \
for plugin in \
  zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh \
  zsh-autosuggestions/zsh-autosuggestions.plugin.zsh \
  zsh-you-should-use/you-should-use.plugin.zsh \
  conda-zsh-completion/conda-zsh-completion.plugin.zsh \
  z/z.sh; do
  source "$ZSH_PLUGINS/$plugin"
done

# zsh autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#757575'

autoload -Uz compinit


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

# setup autocompletion
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# uv autocomplete
eval "$(uv generate-shell-completion zsh)"

# save history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=$HISTFILE
#setopt SHARE_HISTORY

# autocorrect
setopt correct

# change colour of wildcard
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold

# source aliases
source $ZDOTDIR/.zsh_aliases
source $ZDOTDIR/.zsh_aliases_common

export NVM_DIR="$HOME/.local/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(direnv hook zsh)"

eval "$(starship init zsh)"
