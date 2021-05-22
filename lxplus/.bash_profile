# bash profile
export XDG_DATA_HOME=$HOME/.local/share

# default editor
export EDITOR=vim

# bash aliases
source ~/.bash_aliases

# Z
ZLOC=~/private/z/z.sh
[[ -f "$ZLOC" ]] && source $ZLOC
export _Z_DATA=$XDG_DATA_HOME/z

# PS1
source ~/.bash_prompt

# set vi mode
set -o vi
# and re-enable edit-and-execute-command, as this is sometimes nice to use too 
bind -m vi-insert '"\C-x\C-e": edit-and-execute-command'
