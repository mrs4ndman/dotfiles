#!/usr/bin/env bash
tmux list-sessions | sed 's/^\([^:]*\):.*/\1/' | $HOME/.fzf/bin/fzf --reverse | xargs kitty -e tmux attach-session -t 
