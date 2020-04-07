#!/bin/bash
git clone https://github.com/LukeSmithxyz/mutt-wizard
cd mutt-wizard
sudo make install

echo "Run 'mw add' and setup account"
echo "Run 'notmuch setup' to setup mail sorting"
