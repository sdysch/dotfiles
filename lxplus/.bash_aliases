## Source global definitions
#if [ -f /etc/bashrc ]; then
   #. /etc/bashrc
   #fi

# ls
alias ls="ls --color=auto"
#
# custom ls 
alias ll="ls -ltrh"

# grep
alias grep='grep --color=auto'

# human readable memory by default
alias du="du -h"
alias df="df -h"
#
# kerberos authentication
alias kcern="kinit -f -r7d -A SDYSCH@CERN.CH"

# being careful about what I move and delete
alias rm="rm -i"
alias mv="mv -i"

# remove ROOT splash screen
alias rt="root -l"


# vim
export VIMINIT=":source ~/.config/vim/vimrc"

# cd aliases
alias cdwork="cd /afs/cern.ch/work/s/sdysch"
#alias cdTP="cd /afs/cern.ch/work/s/sdysch/private/tag_probe/theo_code/Analysis"
alias cdxTau="cd /afs/cern.ch/work/s/sdysch/private/xTauFramework"
#alias cdCxAOD="cd /afs/cern.ch/work/s/sdysch/private/CxAODFramework"
#alias cdTP="cd /afs/cern.ch/work/s/sdysch/private/tag_probe/updated/Analysis/"
#alias cdFB="cd /afs/cern.ch/work/s/sdysch/private/tag_probe/precise_TauID/"
#alias cdGenerator="cd /afs/cern.ch/work/s/sdysch/private/LepUniv/LepUnivGeneratorStudy"
#alias cdPlotGen="cd /afs/cern.ch/work/s/sdysch/private/LepUniv/LepUnivGenStudyPlotting/"
#alias cdHAPPy="cd /afs/cern.ch/work/s/sdysch/private/HAPPy"
#alias cdTES="cd /afs/cern.ch/work/s/sdysch/private/TES"
# THOR/loki
alias cdTHOR="cd /afs/cern.ch/work/s/sdysch/private/TauIDGenDependence/THOR"
alias cdLOKI="cd /afs/cern.ch/work/s/sdysch/private/TauIDGenDependence/loki/loki"
alias setupLOKI='setupATLAS -q && lsetup "root 6.20.06-x86_64-centos7-gcc8-opt" && source setup.sh'

alias cdLepUniv="cd /afs/cern.ch/work/s/sdysch/private/LepUniv/Analysis"
alias cdNeutrino="cd /afs/cern.ch/work/s/sdysch/private/MajoranaNeutrino"

# LSF
alias bjobs="bjobs -w"
alias bjobswhy="bjobs -p"

# Condor
# tail LOKI jobs
alias tailLoki="condor_tail -f $(condor_q | grep sdysch | awk {'print $10'})"

#remove all my jobs
alias rmAllJobs="condor_rm sdysch"

#automatic job tailing
alias condor_tail="condor_tail -f"

# easier to type
alias jobPeek="condor_tail -f"
alias jobQueue="condor_q -nobatch"
alias jobQueueID="condor_q"
alias whyAreMyJobsHeld="condor_q -hold -af HoldReason"
alias whyAreMyJobsNotRunning="condor_q -better-analyze"

# actual size on EOS
alias duOnEOS="du -s --apparent-size"

# eos size
alias eosSize="duOnEOS /eos/user/s/sdysch/"

# ATLAS specific
alias getProxy="voms-proxy-init -voms atlas"

# Rucio and panda clients
export RUCIO_ACCOUNT=sdysch

# pandamonium
export PATH=$PATH:/afs/cern.ch/user/s/sdysch/private/pandamonium

# retry all failed grid jobs
function retryAllFailedJobs {
	failedJobs=pandamon | grep finished | awk '{print $2}'
	#echo $failedJobs
	panda-resub-taskid $failedJobs
}

# setup panda
function setupPANDA {
	setupATLAS -q
	getProxy
	lsetup panda
}

# setup rucio
function setupRUCIO {
	setupATLAS -q
	getProxy
	lsetup rucio
}

function setupNeutrino {
	setupATLAS -q
	lsetup git
	asetup --restore
	source setupAnalysis.sh || echo "Did not find script!"
	cd ../run
}

# change to eos ntuple productions
function cdEOS {
	cd /eos/user/s/sdysch/LepUniv/LepUniv_ntuples/ntup/$1
	echo "In directory: /eos/user/s/sdysch/LepUniv/LepUniv_ntuples/ntup/$1"
}

# search for samples
function findSamples {
	command -v rucio > /dev/null || setupRUCIO
	#rucio ls user.sdysch:*sdysch*TauID_v02*_Ta | grep CONTAINER | awk -F "|" {'print $2'} | sort > samples.txt
	rucio ls $1 | grep CONTAINER | awk -F "|" {'print $2'} | sort | sed "s/ //g"
}

# wrapper for findSamples, but with my scope set
function findMySamples {
	command -v rucio > /dev/null || setupRUCIO
	rucio ls user.sdysch:*sdysch$1 | grep CONTAINER | awk -F "|" {'print $2'} | sort | sed "s/ //g"
}

# zsh git plugin like aliases
alias gst="git status"
alias gc="git commit"
alias gp="git push"
alias gaa="git add -A"
alias gb="git branch"
