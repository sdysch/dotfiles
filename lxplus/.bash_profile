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
unset ZLOC

# PS1
source ~/.bash_prompt

# ==== key bindings ====
# set vi mode
set -o vi
# re-enable some emacs-style bindings that I am used to
bind -m vi-insert '"\C-x\C-e": edit-and-execute-command'
bind -m vi-insert '"\C-l": clear-screen'
bind -m vi-insert '"\C-a": beginning-of-line'
bind -m vi-insert '"\C-e": end-of-line'
