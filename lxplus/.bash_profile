# bash profile
export XDG_DATA_HOME=$HOME/.local/share

# default editor
export EDITOR=vim

# bash aliases
source ~/.bash_aliases

ZLOC=~/private/z/z.sh
[[ -f "$ZLOC" ]] && source $ZLOC
export _Z_DATA=$XDG_DATA_HOME/z

# === PS1 ===
# how many directories to show in prompt
PROMPT_DIRTRIM=3
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo -e "[on ${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

#export PS1="\[\e[36m\]\u\[\e[m\] \[\e[31m\]@\[\e[m\] \[\e[32m\]\h\[\e[m\] \[\e[31m\]in\[\e[m\] \[\e[33m\]\W\[\e[m\] \[\e[35m\]\`parse_git_branch\`\[\e[m\] \[\e[34m\]\d\[\e[m\] \[\e[34m\]\A\[\e[m\]\n \[\e[1;37m\]→\[\e[0m\] "
PROMPTDATETIME="\[\e[0;38;5;84m\][\d \A\]]\e[m\]"
PROMPTUSER="\[\e[0;38;5;45m\]\u\[\e[m\] \[\e[0;97m\]@\[\e[m\] \[\e[0;38;5;49m\]\h\[\e[m\]"
PROMPTDIR="\[\e[0;97m\]in \[\e[0;38;5;200m\]\w\[\e[m\]"
PROMPTGIT="\[\e[0;38;5;214m\]\`parse_git_branch\`"
PROMPTCHAR="\[\e[0;97m\]→\[\e[0m\]"
# bold
#PROMPTDATETIME="\[\e[0;1;38;5;84m\][\d \A\]]\e[m\]"
#PROMPTUSER="\[\e[0;1;38;5;45m\]\u\[\e[m\] \[\e[0;1;97m\]@\[\e[m\] \[\e[0;1;38;5;49m\]\h\[\e[m\]"
#PROMPTDIR="\[\e[0;1;97m\]in \[\e[0;1;38;5;200m\]\w\[\e[m\]"
#PROMPTGIT="\[\e[0;1;38;5;214m\]\`parse_git_branch\`"
#PROMPTCHAR="\[\e[0;1;97m\]→\[\e[0m\]"
export PS1="$PROMPTDATETIME $PROMPTUSER $PROMPTDIR $PROMPTGIT\n$PROMPTCHAR "
