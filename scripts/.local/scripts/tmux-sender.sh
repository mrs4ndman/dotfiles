#!/usr/bin/env bash
session_selected=$(tmux list-sessions | sed 's/^\([^:]*\):.*/\1/' | $HOME/.fzf/bin/fzf --reverse)

old_cmd_selected=$(tac $HOME/.bash_history | $HOME/.fzf/bin/fzf --reverse)

if [ -z $old_cmd_selected ] || [ -z $session_selected ]; then
    exit 0
fi

# TODO: Find a better way of doing this (maybe like below )
# cmd_selected=$(history | awk '{$1=""; print $0}' | sed 's/^\s*//' | $HOME/.fzf/bin/fzf)
tmux send-keys -t $session_selected $old_cmd_selected  ENTER
