#!/usr/bin/env bash
i3status --config /home/mrsandman/.config/i3status/config | while :
do
    read -r line
    brightness=$(cat /sys/class/backlight/amdgpu_bl1/actual_brightness)
    spot_title=$(playerctl --player=spotify metadata title)
    spot_artist=$(playerctl --player=spotify metadata artist)
    if [[ -z "$spot_title" || -z "$spot_artist" ]]; then
        echo "🎵 No music playing | 💡$brightness% | $line" || exit 1
    else
        echo ">:3 | 🎵 $spot_title < $spot_artist | 💡$brightness% | $line" || exit 1
    fi
done
