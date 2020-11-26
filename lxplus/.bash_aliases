## Source global definitions
#if [ -f /etc/bashrc ]; then
   #. /etc/bashrc
   #fi

# ls
alias ls="ls --color=auto"

export XDG_DATA_HOME=$HOME/.local/share

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
#alias cdLOKI="cd /afs/cern.ch/work/s/sdysch/private/loki"
#alias cdTHOR="cd /afs/cern.ch/work/s/sdysch/private/THOR/THOR/"
#alias setupLOKI='setupATLAS -q && lsetup "root 6.14.04-x86_64-slc6-gcc62-opt" && source setup.sh'

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
alias retryAllFailedJobs="panda-resub-taskid $(pandamon | grep finished | awk {'print $2'})"

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
#
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

# zsh git plugin like aliases
alias gst="git status"
alias gc="git commit"
alias gp="git push"
alias gaa="git add -A"
alias gb="git branch"
