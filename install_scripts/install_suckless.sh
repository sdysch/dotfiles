#!/bin/bash
function install() {
	echo "Installing $1 ....."
	sleep 1
	INSTALLDIR="$HOME/Documents/repos/$1"
	mkdir -p "$INSTALLDIR"
	git clone https://github.com/sdysch/"$1".git "$INSTALLDIR"
	pushd "$INSTALLDIR" || exit 1
	sudo make install
	popd || exit 1
}

mkdir -p /usr/share/xsessions

install dmenu
install dwm
# install st
# install slock
install dwmblocks
