#!/bin/zsh

# kill all already running instances
killall -q auto-con-bt-dev

# launch a new instance
echo > /tmp/auto-con-bt-dev.log
$SCRIPTSPATH/auto-con-bt-dev/auto-con-bt-dev.sh "$1" "$2" >> /tmp/auto-con-bt-dev.log 2>&1 & disown

# print status
printf "Process started!"
