#!/usr/bin/env bash
if [ "$(tmux display-message -p -F "#{session_name}")" = "popup" ]; then
    tmux detach-client
else
    tmux display-popup -E "tmux attach -t popup || tmux new -s popup"
fi
