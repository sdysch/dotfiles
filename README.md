# dotfiles

[![Install Arch](https://github.com/sdysch/dotfiles/actions/workflows/install_arch.yml/badge.svg)](https://github.com/sdysch/dotfiles/actions/workflows/install_arch.yml)

 *  This is a store for the various configuration files that I use, across the machines that I work on.

![arch](https://github.com/sdysch/dotfiles/blob/master/figures/screenshot_arch.png)
![arch](https://github.com/sdysch/dotfiles/blob/master/figures/screenshot_arch2.png)
![arch](https://github.com/sdysch/dotfiles/blob/master/figures/screenshot_arch3.png)
![arch](https://github.com/sdysch/dotfiles/blob/master/figures/screenshot_arch4.png)

## OS setups
### Arch setup
* Window manager: wayland ([hyprland](./setups/arch/.config/hyprland)) + [waybar](./setups/arch/.config/waybar) / [dwm](https://github.com/sdysch/dwm) + [dwmblocks](https://github.com/sdysch/dwmblocks)
* [zsh](./setups/common/.config/zsh)
* [(neo)vim](./setups/common/.config/nvim) + [vim-plug](https://github.com/junegunn/vim-plug)
* Launcher: [rofi](./setups/arch/.config/rofi)

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
* Have to enable many systemd services manually (non-exhaustive list), I haven't kept good records of what I've done
* Partial list with `systemctl list-units --type=service --state=running`
	* NetworkManager.service
	* bluetooth.service
	* cronie.service
	* mpd-mpris.service
	* mpd.service
	* pipewire.service
	* pulseaudio.service
	* sddm.service
	* wpa_supplicant.service
* sddm/lightdm themes need to be installed system- not user-wide

### Xubuntu
Still maintain legacy configs, but they are not guaranteed to work
