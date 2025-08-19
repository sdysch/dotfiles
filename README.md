# dotfiles

[![Install Xubuntu](https://github.com/sdysch/dotfiles/actions/workflows/install_xubuntu.yml/badge.svg)](https://github.com/sdysch/dotfiles/actions/workflows/install_xubuntu.yml)
[![Docker pulls](https://img.shields.io/docker/pulls/sdysch/dotfiles.svg)](https://hub.docker.com/r/sdysch/dotfiles)
[![Docker Image Size](https://img.shields.io/docker/image-size/sdysch/dotfiles/latest)](https://hub.docker.com/r/sdysch/dotfiles/tags?name=latest)

## My dotfiles
 *  This is a store for the various configuration files that I use, across the machines that I work on.

![shell](https://github.com/sdysch/dotfiles/blob/master/figures/screenshot3.png)

## Daily setup
* Window manager: [dwm](https://github.com/sdysch/dwm) + [dwmblocks](https://github.com/sdysch/dwmblocks)
* zsh (bash on lxplus)
* (neo)vim + [Vundle](https://github.com/VundleVim/Vundle.vim)
* Launcher: [dmenu](https://github.com/sdysch/dmenu)

## Installation
* Clone repo to `~/dotfiles`, then follow system specific instructions below
 
### Xubuntu
* Installation with gnu stow
* For home, clone repo to `~/dotfiles` then:
```
cd ~/dotfiles
source install_scripts/install_xubuntu.sh
cd setups
stow --no-folding xubuntu --target=$HOME
```

### Arch
_Still WIP_
* On top of a base arch install + Xorg
* Installation with gnu stow
* For home, clone repo to `~/dotfiles` then:
```
cd ~/dotfiles
source install_scripts/install_arch.sh
cd setups
stow --no-folding arch --target=$HOME
```
* Then reboot

### Deprecated setups
These are setups that I no longer use, the tag with these setups still in use is [https://github.com/sdysch/dotfiles/releases/tag/before_removing_legacy_configs](before_removing_legacy_configs)

#### mac
* Installation with gnu stow
```
# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
cd ~/dotfiles
cat packages/cask.txt packages/leaves.txt | xargs brew install
stow --no-folding mac
```

#### lxplus
* Clone repo to `~/dotfiles`, then:
```
cd ~/dotfiles
source install_scripts/install_lxplus.sh
```

#### Manchester
* Clone repo to `~/dotfiles`, then:
```
cd ~/dotfiles
source install_scripts/install_manchester.sh
```

For Manchester, to do anything useful with git, be sure to do
```
setupATLAS
lsetup git
```
on a machine with cvmfs available. The default git version (1.7.1) is _way_ too old....
