#!/bin/zsh

# kill all already running instances
killall -q auto-con-bt-dev

# launch a new instance
$SCRIPTSPATH/auto-con-bt-dev/auto-con-bt-dev.sh "$1" "$2" > /dev/null 2>&1 & disown

# print status
printf "Process started!"
