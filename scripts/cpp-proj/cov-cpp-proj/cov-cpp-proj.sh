#!/bin/dash

# Utility for testing the coverage of a c++ application built with the build-cpp-proj utility

if [ $# -le 0 ] ; then 
	echo "\nNo option given. Type 'cov-cpp-proj --help' for more info."
	exit 1

elif [ $1 = "-h" ] || [ $1 = "--help" ] ; then
	echo "\nUtility for testing the coverage of c++ projects built with the build-cpp-proj utility."
	echo "NOTICE: This utility also tests the coverage of unit tests made with google testing framework.\n"
	echo "USAGE: run-cpp-proj [OPTIONS]"
	echo "OPTIONS:"
	echo "  -h, --help             Display this message and exit"
	echo "  -a, --all              Test the coverage of all executables, including tests\n"
	echo "For more info please contact me at: adi.pop.bv@gmail.com"
	exit 0

elif [ $1 = "-a" ] || [ $1 = "--all" ] ; then
	buildPath=`findup -name build`
	if [ $? -ne 0 ] ; then
		echo "\nBuild directory not found! Exiting."
		exit 1
	fi
	projName=`grep "project" "$buildPath/../CMakeLists.txt" | grep -o "(.*)" | grep -o "[^\(^\)]*"`
	cd "$buildPath"
	make "$projName-coverage" > /dev/null 2>&1
	firefox "$buildPath/coverage/index.html"
	exit 0

else
	echo "\nOption invalid. Type 'cov-cpp-proj --help' for more info."
	exit 1

fi


