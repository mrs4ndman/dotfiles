#!/usr/bin/env bash
i3status --config /home/mrsandman/.config/i3status/config | while :
do
    read -r line
    brightness=$(brightnessctl i | grep -oP '\(\K[0-9]+(?=%\))')    
    playing_title=$(playerctl --player=spotify metadata title)
    playing_subtitle=$(playerctl --player=spotify metadata artist)
    if [[ -z "$playing_title" || -z "$playing_subtitle" ]]; then
        echo "Nothing playing | 💡$brightness% | $line" || exit 1
    else
        echo ">_< | 🎹 $playing_title < $playing_subtitle | 💡$brightness% | $line" || exit 1
    fi
done
