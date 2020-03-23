#!/bin/bash
#REF: https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/prompt

# A dmenu binary prompt script.
# Gives a dmenu prompt labeled with $1 to perform command $2.
# For example:
# `./prompt "Do you want to shutdown?" "shutdown -h now"`

[ "$(printf "No\\nYes" | dmenu -i -p "$1" -nb darkblue -sb blue -sf white -nf gray )" = "Yes" ] && $2
