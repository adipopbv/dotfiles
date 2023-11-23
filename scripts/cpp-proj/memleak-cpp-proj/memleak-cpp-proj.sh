#!/bin/dash

# Utility for checking a c++ application built with the build-cpp-proj utility for memory leaks 

if [ $# -le 0 ] ; then 
	echo "\nNo option given. Type 'memleak-cpp-proj --help' for more info."
	exit 1

elif [ $1 = "-h" ] || [ $1 = "--help" ] ; then
	echo "\nUtility for checking c++ projects built with the build-cpp-proj utility for memory leaks."
	echo "NOTICE: This utility also can check unit tests, made with google testing framework, for memory leaks.\n"
	echo "USAGE: memleak-cpp-proj [OPTIONS]"
	echo "OPTIONS:"
	echo "  -h, --help             Display this message and exit"
	echo "  -a, --app              Check the built application binary file for memory leaks"
	echo "  -t, --tests            Check the built tests for the app source files for memory leaks\n"
	echo "For more info please contact me at: adi.pop.bv@gmail.com"
	exit 0

elif [ $1 = "-a" ] || [ $1 = "--app" ] ; then
	buildPath=`findup -name build`
	if [ $? -ne 0 ] ; then
		echo "\nBuild directory not found! Exiting."
		exit 1
	fi
	projName=`grep "project" "$buildPath/../CMakeLists.txt" | grep -o "(.*)" | grep -o "[^\(^\)]*"`
	valgrind --leak-check=full --show-leak-kinds=all "$buildPath/src/$projName-run"
	echo
	read -p "Press ENTER to continue..." response
	exit 0

elif [ $1 = "-t" ] || [ $1 = "--tests" ] ; then
	buildPath=`findup -name build`
	if [ $? -ne 0 ] ; then
		echo "\nBuild directory not found! Exiting."
		exit 1
	fi
	projName=`grep "project" "$buildPath/../CMakeLists.txt" | grep -o "(.*)" | grep -o "[^\(^\)]*"`
	valgrind --leak-check=full --show-leak-kinds=all "$buildPath/test/$projName-test"
	#valgrind "$buildPath/test/$projName-test"
	echo
	read -p "Press ENTER to continue..." response
	exit 0

else
	echo "\nOption invalid. Type 'run-cpp-proj --help' for more info."
	exit 1

fi

