#!/bin/env sh

# Kill all polybar processes
sudo killall -9 polybar

# Position hdmi monitor same as laptop monitor
xrandr --output HDMI1 --same-as eDP1

# Launch the polybar script
${HOME}/.config/polybar/i3wmthemer_bar_launch.sh

# Set keyboard layout
sudo setxkbmap -layout br
