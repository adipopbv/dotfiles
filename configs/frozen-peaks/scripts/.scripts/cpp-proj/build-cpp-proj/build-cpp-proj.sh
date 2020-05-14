#!/bin/dash

# Utility for building a c++ project generated with the gen-cpp-proj utility

if [ $# -le 0 ] ; then 
	echo "\nNo option given. Type 'build-cpp-proj --help' for more info."
	exit 1

elif [ $1 = "-h" ] || [ $1 = "--help" ] ; then
	echo "\nUtility for building c++ projects generated with the gen-cpp-proj utility."
	echo "NOTICE: This utility also compiles tests made with google testing framework.\n"
	echo "USAGE: build-cpp-proj [OPTIONS]"
	echo "OPTIONS:"
	echo "  -h, --help             Display this message and exit"
	echo "  -a, --all              Build all files\n"
	echo "For more info please contact me at: adi.pop.bv@gmail.com"
	exit 0

elif [ $1 = "-a" ] || [ $1 = "--all" ] ; then
	buildPath=`findup -name build`
	cd "$buildPath"
	cmake .. -G 'Unix Makefiles' && make all && echo "\nBuilt all succesfuly."
	echo
	read -p "Press ENTER to continue..." response
	exit 0

else
	echo "\nOption invalid. Type 'build-cpp-proj --help' for more info."
	exit 1

fi

