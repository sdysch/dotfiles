#!/bin/bash
echo "Installing dmenu build ...."
sleep 1
INSTALLDIR="$HOME/Documents/repos"
mkdir -p $INSTALLDIR
git clone git@github.com:sdysch/dmenu.git $INSTALLDIR
cd $INSTALLDIR/dmenu
sudo make install
