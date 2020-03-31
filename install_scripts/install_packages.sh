#!/bin/bash
sudo apt-get install $(cat packages.txt)
pip3 install -r python_packages.txt
source install_scripts/install_vim.sh
source install_scripts/install_tmux.sh
source install_scripts/install_fonts.sh
source install_scripts/install_zsh.sh
