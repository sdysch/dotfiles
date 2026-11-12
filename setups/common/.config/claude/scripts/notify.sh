#!/usr/bin/env bash
set -u
 
command -v notify-send >/dev/null 2>&1 || exit 0
payload=$(cat)
notification_type=$(printf '%s' "$payload" | jq -r '.notification_type // "Claude Code"' 2>/dev/null || printf '%s' 'Claude Code')
message=$(printf '%s' "$payload" | jq -r '.message // "Claude Code needs your attention."' 2>/dev/null || printf '%s' 'Claude Code needs your attention.')
 
# Keep desktop notifications short and avoid dumping arbitrary event JSON.
case "$notification_type" in
  permission_prompt) title='Claude Code: approval needed' ;;
  idle_prompt) title='Claude Code: waiting' ;;
  agent_needs_input) title='Claude Code: agent needs input' ;;
  agent_completed) title='Claude Code: agent completed' ;;
  *) title='Claude Code' ;;
esac
 
notify-send --app-name='Claude Code' --urgency=normal "$title" "$message" >/dev/null 2>&1 || true
exit 0
