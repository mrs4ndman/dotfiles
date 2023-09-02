#!/usr/bin/env bash
i3status --config /home/mrsandman/.config/i3status/config | while :
do
    read -r line
    brightness=$(cat /sys/class/backlight/amdgpu_bl0/actual_brightness)
    spot_title=$(playerctl --player=spotify metadata title)
    spot_artist=$(playerctl --player=spotify metadata artist)
    echo "🎵 $spot_title < $spot_artist | 💡$brightness% | $line" || exit 1
done
