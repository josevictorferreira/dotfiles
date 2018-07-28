#!/bin/env sh

# Kill all polybar procceses
sudo killall -9 polybar

# Position hdmi monitor right of laptop monitor
xrandr --output HDMI1 --right-of eDP1

# Launch the polybar script
${HOME}/.config/polybar/i3wmthemer_bar_launch.sh

# Set keyboard layout
sudo setxkbmap -layout us
