# dotfiles

[![pipeline status](https://gitlab.com/sdysch/dotfiles/badges/master/pipeline.svg)](https://gitlab.com/sdysch/dotfiles/-/commits/master)
[![CodeFactor](https://www.codefactor.io/repository/github/sdysch/dotfiles/badge)](https://www.codefactor.io/repository/github/sdysch/dotfiles)

## My dotfiles
 * If you are reading this, then I probably wouldn't bother or waste your time. This is just a store for the various configuration files that I use, across the machines that I work on.
 * That being said, if you wish to steal anything, (as I undoubtedly have), then please be my guest!

![shell](figures/screenshot3.png)

## Setup
* OS: [xubuntu](https://xubuntu.org/) 20.04 (xfce)
	* Trouble setting up wireless drivers. See https://askubuntu.com/questions/1218141/dell-vostro-5490-no-wifi-in-ubuntu-18-04
	* Script in .local/bin/restorewifi to fix
* Window manager: [dwm](https://github.com/sdysch/dwm)
* zsh (bash on lxplus)
* (neo)vim + [Vundle](https://github.com/VundleVim/Vundle.vim)
* My [custom dmenu build](https://github.com/sdysch/dmenu)

## Installation
* Some installation instructions can be found [here](docs/install.md), but they may be out of date
 
### Home
* Installation with gnu stow
* Clone repo to `~/dotfiles`, then:
* For home, clone repo to ~/dotfiles then:
```
cd ~/dotfiles
source install_scripts/install_packages.sh
stow --no-folding home
```

### mac
* Installation with gnu stow
* Clone repo to `~/dotfiles`, then:
```
cd ~/dotfiles
source install_scripts/install_packages.sh
stow --no-folding mac
```

### lxplus
* Clone repo to `~/dotfiles`, then:
```
cd ~/dotfiles
source install_scripts/install_lxplus.sh
```

* Mirror [here](https://github.com/sdysch/dotfiles)
