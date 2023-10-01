#!/usr/bin/env bash
current=$(tmux display-message -p '#S')
tmux list-sessions | grep -v "$current" | sed 's/^\([^:]*\):.*/\1/' | "$HOME"/.fzf/bin/fzf --reverse | xargs tmux switch-client -t 
