# dotfiles

[![Install Arch](https://github.com/sdysch/dotfiles/actions/workflows/install_arch.yml/badge.svg)](https://github.com/sdysch/dotfiles/actions/workflows/install_arch.yml)
[![Install Xubuntu](https://github.com/sdysch/dotfiles/actions/workflows/install_xubuntu.yml/badge.svg)](https://github.com/sdysch/dotfiles/actions/workflows/install_xubuntu.yml)

 *  This is a store for the various configuration files that I use, across the machines that I work on.

![arch](https://github.com/sdysch/dotfiles/blob/master/figures/screenshot_arch_wayland.png)
![arch](https://github.com/sdysch/dotfiles/blob/master/figures/screenshot_arch_wayland2.png)
![xubuntu](https://github.com/sdysch/dotfiles/blob/master/figures/screenshot3.png)

## OS setups
### Arch setup
* Window manager: wayland ([hyprland](./setups/arch/.config/hyprland)) + [waybar](./setups/arch/.config/waybar) / [dwm](https://github.com/sdysch/dwm) + [dwmblocks](https://github.com/sdysch/dwmblocks)
* [zsh](./setups/arch/.config/zsh)
* [(neo)vim](./setups/common/nvim) + [vim-plug](https://github.com/junegunn/vim-plug)
* Launcher: [rofi](./setups/arch/.config/rofi)

### Xubuntu setup
* Window manager: [dwm](https://github.com/sdysch/dwm) + [dwmblocks](https://github.com/sdysch/dwmblocks)
* [zsh](./setups/xubuntu/.config/zsh)
* [(neo)vim](./setups/common/nvim) + [vim-plug](https://github.com/junegunn/vim-plug)
* Launcher: [dmenu](https://github.com/sdysch/dmenu)

## Installation
* Clone repo to `~/dotfiles`, then follow system specific instructions below

### Arch
_My main/daily driver_
* On top of a base arch install 
* Installation with gnu stow
* For home, clone repo to `~/dotfiles` then:
```
cd ~/dotfiles
source install_scripts/install_arch.sh
cd setups
stow --no-folding arch --target=$HOME
stow --no-folding common --target=$HOME
```
* Then reboot

#### Annoyances
* Have to enable many systemd services manually (non-exhaustive list)
	* network manager
	* cron
	* bluetooth
	* lightdm/sddm
	* ssh agent
* sddm/lightdm themes need to be installed system- not user-wide
 
### Xubuntu
_Used for years before switching to arch as main, I still maintain legacy configs for now_
* Installation with gnu stow
* For home, clone repo to `~/dotfiles` then:
```
cd ~/dotfiles
source install_scripts/install_xubuntu.sh
cd setups
stow --no-folding xubuntu --target=$HOME
stow --no-folding common --target=$HOME
```


### Deprecated setups
These are setups that I no longer use, the tag with these setups still in use is [before_removing_legacy_configs](https://github.com/sdysch/dotfiles/releases/tag/before_removing_legacy_configs)

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
on a machine with cvmfs available. The default git version that is installed on these machines (1.7.1) is _way_ too old (yes it is completely ridiculous that this is required)
