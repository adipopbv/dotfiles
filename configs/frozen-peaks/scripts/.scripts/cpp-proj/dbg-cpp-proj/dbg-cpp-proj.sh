#!/bin/dash

# Utility for debugging a c++ application built with the build-cpp-proj utility

if [ $# -le 0 ] ; then 
	echo "\nNo option given. Type 'dbg-cpp-proj --help' for more info."
	exit 1

elif [ $1 = "-h" ] || [ $1 = "--help" ] ; then
	echo "\nUtility for debugging c++ projects built with the build-cpp-proj utility."
	echo "NOTICE: This utility also can debug unit tests made with google testing framework.\n"
	echo "USAGE: dbg-cpp-proj [OPTIONS]"
	echo "OPTIONS:"
	echo "  -h, --help             Display this message and exit"
	echo "  -a, --app              Debug the built application binary file"
	echo "  -t, --tests            Debug the built tests for the app source files\n"
	echo "For more info please contact me at: adi.pop.bv@gmail.com"
	exit 0

elif [ $1 = "-a" ] || [ $1 = "--app" ] ; then
	buildPath=`findup -name build`
	if [ $? -ne 0 ] ; then
		echo "\nBuild directory not found! Exiting."
		exit 1
	fi
	projName=`grep "project" "$buildPath/../CMakeLists.txt" | grep -o "(.*)" | grep -o "[^\(^\)]*"`
	gdb "$buildPath/src/$projName-run"
	exit 0

elif [ $1 = "-t" ] || [ $1 = "--tests" ] ; then
	buildPath=`findup -name build`
	if [ $? -ne 0 ] ; then
		echo "\nBuild directory not found! Exiting."
		exit 1
	fi
	projName=`grep "project" "$buildPath/../CMakeLists.txt" | grep -o "(.*)" | grep -o "[^\(^\)]*"`
	gdb "$buildPath/test/$projName-test"
	exit 0

else
	echo "\nOption invalid. Type 'dbg-cpp-proj --help' for more info."
	exit 1

fi

