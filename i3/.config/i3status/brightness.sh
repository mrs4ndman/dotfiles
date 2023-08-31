#!/bin/sh
i3status --config /home/mrsandman/.config/i3status/config | while :
do
    read -r line
    brightness=$(cat /sys/class/backlight/amdgpu_bl0/actual_brightness)
    echo "💡$brightness% | $line" || exit 1
done
