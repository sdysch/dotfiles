# bash profile

# custom ls 
alias ll="ls -ltrh"

# colours
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# grep
alias grep='grep --color=auto'

# human readable memory by default
alias du="du -h"
alias df="df -h"

# ssh aliases
# Login to Manchester hep machines
alias TONY="ssh -X -Y samdysch@tony.hep.manchester.ac.uk"
alias HIGGS="ssh -X -Y samdysch@higgs.hep.manchester.ac.uk"
alias GPU="ssh -X -Y samdysch@hepgpu1.hep.manchester.ac.uk"
alias PC2014="ssh -X -Y samdysch@pc2014.hep.manchester.ac.uk"
alias PC2013="ssh -X -Y samdysch@pc2013.hep.manchester.ac.uk"

# Login to CERN lxplus
alias CERN="ssh -X -Y sdysch@lxplus.cern.ch"

# remove ROOT splash screen
alias rt="root -l"

# terminal prompt (PS1), show git branch
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="[ \d \t \u: ] \[\033[32m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# default editor
export EDITOR=vim

# kerberos authentication
alias kcern="kinit -f -r7d -A SDYSCH@CERN.CH"

# platform specific stuff
if [[ "$(hostname)" =~ "lxplus" ]]; then
	
	# lxplus specific bash aliases
	source ~/.bash_aliases_lxplus

elif [ "$(uname)" == "Darwin" ]; then

	# mac specific bash aliases
	source ~/.bash_aliases_mac

# personal laptop
if [[ "$(hostname)" =~ "sam-Lenovo" ]]; then
	
	# lxplus specific bash aliases
	source ~/.bash_aliases_sam

else
	# personal bash aliases
	source ~/.bash_aliases_personal
fi
