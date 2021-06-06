export XDG_DATA_HOME=$HOME/.local/share

# ls
alias ls="ls --color=auto"

# custom ls 
alias ll="ls -ltrh"

# grep
alias grep='grep --color=auto'

# human readable memory by default
alias du="du -h"
alias df="df -h"

# kerberos authentication
alias kcern="kinit -f -r7d -A SDYSCH@CERN.CH"

# being careful about what I move and delete
alias rm="rm -i"
alias mv="mv -i"

# remove ROOT splash screen
alias rt="root -l"

# vim <3
export VIMINIT=":source ~/.config/vim/vimrc"
export EDITOR=vim

# Rucio and panda clients
export RUCIO_ACCOUNT=sdysch

# zsh git plugin like aliases
alias gst="git status"
alias gc="git commit"
alias gp="git push"
alias gaa="git add -A"
alias gb="git branch"

# bind autocomplete to aliases that I will need it for
#__git_complete gp _git_push
#__git_complete gb _git_branch

# setup ATLAS environment
export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'

# GRID proxy
alias getProxy="voms-proxy-init -voms atlas"

# rucio
export RUCIO_ACCOUNT=sdysch
alias setupRUCIO="setupATLAS && getProxy && lsetup rucio"

# bash prompt
source ~/.bash_prompt

# ==== key bindings ====
# set vi mode
set -o vi
# re-enable some emacs-style bindings that I am used to
bind -m vi-insert '"\C-x\C-e": edit-and-execute-command'
bind -m vi-insert '"\C-l": clear-screen'
bind -m vi-insert '"\C-a": beginning-of-line'
bind -m vi-insert '"\C-e": end-of-line'
