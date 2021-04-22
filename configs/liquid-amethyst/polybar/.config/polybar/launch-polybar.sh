#!/usr/bin/zsh

# Terminate already running bar instances
killall -q polybar

# Launch bars
polybar left-top >> /tmp/polybar-left-top.log 2>&1 &
polybar center-top >> /tmp/polybar-center-top.log 2>&1 &
polybar center-top-secondary >> /tmp/polybar-center-top-secondary.log 2>&1 &
polybar right-top >> /tmp/polybar-right-top.log 2>&1 &

# Print status
printf "Polybar launched!"

