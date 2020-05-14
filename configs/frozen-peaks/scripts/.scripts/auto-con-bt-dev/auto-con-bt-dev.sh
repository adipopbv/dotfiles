#!/bin/zsh

# Utility for auto connecting a bluetooth device
# 	Uses bluetoothctl, bt-device, grep and awk binaries!

if [ $# -eq 0 ] ; then
	printf "\nNo option given. Run with '--help' for more info.\n"
	exit 1
fi
# help option
if [ $1 = "-h" ] || [ $1 = "--help" ] ; then
	# print help message
	printf "\nUtility for auto connecting to bluetooth device.\n"
	printf "Use it with '&' at the end to run it in background.\n\n"
	printf "USAGE: $0 [OPTION] [DEVICE]\n"
	printf "OPTIONS:\n"
	printf "  -h, --help       Display this message and exit\n"
	printf "  -n, --name       Connect to device by name\n"
	printf "  -m, --mac        Connect to device by mac address\n\n"
	printf "For more info please contact me at: adi.pop.bv@gmail.com\n"
	# exit process
	exit 0
fi

# get device by name option
if [ $1 = "-n" ] || [ $1 = "--name" ] ; then
	# get the name of the device
	name=$2

	# get the mac address of the device
	macaddress=`bt-device -l | grep "$name" | grep -o "(.*)" | grep -o "[0-9A-Z]\{2\}\:.*[0-9A-Z]\{2\}"`

	# check device existance
	finddevice=`bt-device -l | grep "$name"`
	if [ $? -ne 0 ] ; then
		printf "\nDevice not found! Process stoped.\n"
		exit 1
	fi

# get device by mac address option
elif [ $1 = "-m" ] || [ $1 = "--mac" ] ; then
	# get the mac address of the device
	macaddress=$2

	# check device existance
	finddevice=`bt-device -l | grep "$macaddress"`
	if [ $? -ne 0 ] ; then
		printf "\nDevice not found! Process stoped.\n"
		exit 1
	fi

# option does not exist
else
	printf "\nInvalid option! Run with '--help' for more info.\n"
	# exit process
	exit 1
fi

printf "\nProcess started.\n"

# loop searching for device and connecting to it
while true
do
	# wait 2 seconds between connecting attempts
	sleep 2
	# test the connection status of the given device
	if [ `bt-device -i $macaddress | grep -i "connected" | awk '{print $2}'` = 0 ] ; then
		# connect to device via bluetoothctl command if not connected already
		`bluetoothctl << EOF > /dev/null 2>&1
		connect $macaddress
		EOF`
	fi
done

