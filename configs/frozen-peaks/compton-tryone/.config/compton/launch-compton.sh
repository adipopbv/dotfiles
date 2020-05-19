#!/bin/zsh

# Terminate already running compton insatnces
killall -q compton

# Launch a new compton instance
compton --config $HOME/.config/compton/compton.conf -b

# Print status
printf "Compton launched!"
