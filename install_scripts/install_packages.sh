#!/bin/bash
sudo apt-get install $(cat packages.txt)
pip3 install -r python_packages.txt

echo "cloning taskwarrior"
mkdir -p $HOME/.task
git clone https://github.com/sdysch/taskwarrior_backups.git $HOME/.task/

# install crontab
cat crontab/crontab | crontab -

source install_scripts/packages/install_vim.sh
source install_scripts/packages/install_tmux.sh
source install_scripts/packages/install_fonts.sh
source install_scripts/packages/install_zsh.sh
