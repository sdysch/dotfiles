#!/bin/bash

# install i3wm
# Additional configuration required in i3/README.md
#REF, i3-gaps: https://gist.github.com/dabroder/813a941218bdb164fb4c178d464d5c23

# nitrogen needed to change desktop background
sudo apt-get install i3-wm nitrogen

#========================
#	      i3-gaps
#========================

pwd=$(pwd)

sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake
cd /tmp

# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
cd build
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

cd $pwd
