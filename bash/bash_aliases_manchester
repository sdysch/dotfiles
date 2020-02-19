# ls
alias ls="ls --color=auto"

# ATLAS software
export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase

# setup ATLAS environment
alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'

# GRID proxy
alias getProxy="voms-proxy-init -voms atlas"

# rucio
export RUCIO_ACCOUNT=sdysch
alias setupRUCIO="setupATLAS && getProxy && lsetup rucio"
