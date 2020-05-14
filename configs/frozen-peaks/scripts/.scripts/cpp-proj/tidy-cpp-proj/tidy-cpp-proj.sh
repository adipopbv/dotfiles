#!/bin/dash

# Utility for improving a c++ application built with the build-cpp-proj utility

if [ $# -le 0 ] ; then 
	echo "\nNo option given. Type 'tidy-cpp-proj --help' for more info."
	exit 1

elif [ $1 = "-h" ] || [ $1 = "--help" ] ; then
	echo "\nUtility for improving the source code of c++ projects built with the build-cpp-proj utility."
	echo "NOTICE: This utility also can show improvements of unit tests made with google testing framework.\n"
	echo "USAGE: tidy-cpp-proj [OPTIONS]"
	echo "OPTIONS:"
	echo "  -h, --help             Display this message and exit"
	echo "  -a, --app              Show improvements for the built application binary file"
	echo "  -t, --tests            Show improvements for the built tests for the app source files\n"
	echo "For more info please contact me at: adi.pop.bv@gmail.com"
	exit 0

elif [ $1 = "-a" ] || [ $1 = "--app" ] ; then
	buildPath=`findup -name build`
	if [ $? -ne 0 ] ; then
		echo "\nBuild directory not found! Exiting."
		exit 1
	fi
	cd "$buildPath"
	echo "Clang tidy 9 running...\n"
	clang-tidy-9 -checks="*,-fuchsia*,-readability-convert-member-functions-to-static,-readability-redundant-string-init,-modernize-use-trailing-return-type,-modernize-loop-convert,-performance-unnecessary-value-param,-hicpp-exception-baseclass,-cppcoreguidelines-avoid-magic-numbers,-readability-magic-numbers" `find "../src/" -type f -name \*.cpp` -- -Imy_project/include -DMY_DEFINES ...
	echo
	read -p "Press ENTER to continue..." response
	exit 0

elif [ $1 = "-t" ] || [ $1 = "--tests" ] ; then
	buildPath=`findup -name build`
	if [ $? -ne 0 ] ; then
		echo "\nBuild directory not found! Exiting."
		exit 1
	fi
	cd "$buildPath"
	echo "Clang tidy 9 running...\n"
	clang-tidy-9 -checks="*,-fuchsia*,-readability-convert-member-functions-to-static,-readability-redundant-string-init,-modernize-use-trailing-return-type,-modernize-loop-convert,-performance-unnecessary-value-param,-hicpp-exception-baseclass,-cppcoreguidelines-avoid-magic-numbers,-readability-magic-numbers" `find "../test/" -type f -name \*.cpp` -- -Imy_project/include -DMY_DEFINES ...
	echo
	read -p "Press ENTER to continue..." response
	exit 0

else
	echo "\nOption invalid. Type 'tidy-cpp-proj --help' for more info."
	exit 1

fi

