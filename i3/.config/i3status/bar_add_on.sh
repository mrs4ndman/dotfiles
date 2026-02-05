#!/usr/bin/env bash
i3status --config /home/mrsandman/.config/i3status/config | while :
do
    read -r line
    brightness=$(brightnessctl i | grep -oP '\(\K[0-9]+(?=%\))')    
    playing_title=$(playerctl --player=presto metadata title)
    playing_artist=$(playerctl --player=presto metadata artist)
    if [[ -z "$playing_title" || -z "$playing_artist" ]]; then
        echo "Nothing playing | 💡$brightness% | $line" || exit 1
    else
        echo ">_< | 🎹 $playing_title < $playing_artist | 💡$brightness% | $line" || exit 1
    fi
done
