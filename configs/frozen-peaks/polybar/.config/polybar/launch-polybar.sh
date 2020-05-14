#!/usr/bin/zsh

# Terminate already running bar instances
killall -q polybar

# Launch adibar1
polybar center-top >> /tmp/polybar-center-top.log 2>&1 &

# Print status
printf "Polybar launched!"

