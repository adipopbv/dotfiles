#!/bin/dash

# Utility for generating the necessary directories and files for a fully working c++ project
# Uses google testing framework

if [ $# -le 0 ] ; then
	echo "\nNo option given. Type 'gen-cpp-proj --help' for more info."
	exit 1

elif [ $1 = "-h" ] || [ $1 = "--help" ] ; then
	echo "\nUtility for generating c++ project structure and cmake files."
	echo "NOTICE: This utility makes files for google testing framework.\n"
	echo "USAGE: gen-cpp-proj [OPTIONS] [PROJECT NAME]"
	echo "OPTIONS:"
	echo "  -h, --help                            Display this message and exit"
	echo "  -n, --name NAME [-qt QTPATH]      Create project with given name in current directory (with qt support if wanted)\n"
	echo "For more info please contact me at: adi.pop.bv@gmail.com"
	exit 0

elif [ $1 = "-n" ] || [ $1 = "--name" ] ; then
	projectName=$2
	
	mkdir "$projectName"
	touch "$projectName/CMakeLists.txt"
	echo "cmake_minimum_required(VERSION 3.0)\nproject($projectName)\n" > "$projectName/CMakeLists.txt"
	cat ~/.scripts/cpp-proj/gen-cpp-proj/base-cmakelists.txt >> "$projectName/CMakeLists.txt"
	
	mkdir "$projectName/build"

	mkdir "$projectName/CMakeModules"
	touch "$projectName/CMakeModules/CodeCoverage.cmake"
	cat ~/.scripts/cpp-proj/gen-cpp-proj/CodeCoverage.cmake > "$projectName/CMakeModules/CodeCoverage.cmake"
	
	mkdir "$projectName/lib"
	
	mkdir "$projectName/src"
	touch "$projectName/src/main.cpp"
	cat ~/.scripts/cpp-proj/gen-cpp-proj/src-main.cpp > "$projectName/src/main.cpp"
	touch "$projectName/src/CMakeLists.txt"
	if [ $# -ge 3 ] ; then
		if [ $3 = "-qt" ] ; then
			echo "set(CMAKE_PREFIX_PATH" $4 ")" > "$projectName/src/CMakeLists.txt"
			cat $SCRIPTSPATH/cpp-proj/gen-cpp-proj/src-qt-cmakelists.txt >> "$projectName/src/CMakeLists.txt"
		fi
	else
		cat ~/.scripts/cpp-proj/gen-cpp-proj/src-cmakelists.txt > "$projectName/src/CMakeLists.txt"
	fi
	
	mkdir "$projectName/test"
	touch "$projectName/test/main.cpp"
	cat ~/.scripts/cpp-proj/gen-cpp-proj/test-main.cpp > "$projectName/test/main.cpp"
	touch "$projectName/test/CMakeLists.txt"
	cat ~/.scripts/cpp-proj/gen-cpp-proj/test-cmakelists.txt > "$projectName/test/CMakeLists.txt"

	cd "$projectName"
	build-cpp-proj --all
	ln -s "build/compile_commands.json" "compile_commands.json"
	
	echo "\nProject created successfuly."
	exit 0

else
	echo "\nOption invalid. Type 'gen-cpp-proj --help' for more info."
	exit 1

fi
