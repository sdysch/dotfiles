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

# zsh autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#757575'

# conda autocomplete
fpath+=$ZSH_PLUGINS/conda-zsh-completion
compinit conda


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

# save history
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=$HISTFILE
#setopt SHARE_HISTORY

# change colour of wildcard
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sdysch/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sdysch/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sdysch/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sdysch/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# common aliases
source $ZDOTDIR/.zsh_aliases

export NVM_DIR="$HOME/.local/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
