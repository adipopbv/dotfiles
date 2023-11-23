#!/bin/bash

result=1
while [[ $PWD != / ]] ; do
    find "$PWD"/ -maxdepth 1 "$@" | grep -q "$2"
	if [ $? -eq 0 ] ; then
		result=0
		find "$PWD"/ -maxdepth 1 "$@"
	fi
    cd ..
done

exit $result
