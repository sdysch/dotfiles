#!/usr/bin/env bash
input=$(cat)
cwd=$(jq -r '.workspace.current_dir' <<<"$input")
model=$(jq -r '.model.display_name' <<<"$input")
used=$(jq -r '.context_window.used_percentage // empty' <<<"$input")

sep=$''   # powerline arrow, matches the starship separators
rgb() { local h=${1#\#}; printf '%d;%d;%d' "0x${h:0:2}" "0x${h:2:2}" "0x${h:4:2}"; }
prev=""
seg() {  # usage: seg BG FG TEXT
  local bg=$1 fg=$2 text=$3
  [ -n "$prev" ] && printf '\033[38;2;%sm\033[48;2;%sm%s' "$(rgb "$prev")" "$(rgb "$bg")" "$sep"
  printf '\033[38;2;%sm\033[48;2;%sm%s' "$(rgb "$fg")" "$(rgb "$bg")" "$text"
  prev=$bg
}

# directory: ~ substitution, last 3 components
dir=${cwd/#$HOME/\~}
dir=$(awk -F/ '{n=NF; if(n>3){printf "…/%s/%s/%s",$(n-2),$(n-1),$n}else print $0}' <<<"$dir")

# git branch and dirty marker (skip optional locks)
branch=$(git --no-optional-locks -C "$cwd" symbolic-ref --short HEAD 2>/dev/null)
dirty=""
if [ -n "$branch" ] && [ -n "$(git --no-optional-locks -C "$cwd" status --porcelain 2>/dev/null)" ]; then
  dirty=" ✎"
fi

seg "#2e3440" "#d8dee9" " $(whoami) "
seg "#5e81ac" "#2e3440" "@$(hostname -s)"
seg "#81a1c1" "#2e3440" " 󰉋 $dir "
[ -n "$branch" ] && seg "#88c0d0" "#2e3440" " 󰘬 $branch$dirty "
[ -n "$model" ] && seg "#8fbcbb" "#2e3440" " $model "
[ -n "$used" ] && seg "#d8dee9" "#2e3440" " ctx $(printf '%.0f' "$used")% "
seg "#5e81ac" "#2e3440" " $(date +%H:%M) "

# closing arrow and reset
printf '\033[38;2;%sm\033[49m%s\033[0m' "$(rgb "$prev")" "$sep"
