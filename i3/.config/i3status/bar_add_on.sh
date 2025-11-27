#!/usr/bin/env bash
i3status --config /home/mrsandman/.config/i3status/config | while :
do
    read -r line
    brightness=$(brightnessctl i | grep -oP '\(\K[0-9]+(?=%\))')    
    spot_title=$(playerctl --player=spotify metadata title)
    spot_artist=$(playerctl --player=spotify metadata artist)
    if [[ -z "$spot_title" || -z "$spot_artist" ]]; then
        echo "🎵 No music playing | 💡$brightness% | $line" || exit 1
    else
        echo ">_< | 🎵 $spot_title < $spot_artist | 💡$brightness% | $line" || exit 1
    fi
done
