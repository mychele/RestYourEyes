#!/bin/bash

# some help
if [ "$1" == "-help" ]; then
	echo -en "\nUsage: username$ $0 min";
	echo -en "\nwhere min is how many minutes you want to work";
	echo -en "\n\n";
	exit 0;
fi

# check if the (optional) argument passed is positive integer
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] && [ $# -gt 0 ]; then
   echo "error: Not a number" >&2; exit 1
fi

# tipically work for 60 minutes
# of use user input if provided
MIN=${1:-60};

#compute seconds
SEC=$(($MIN*60));

for i in $(seq 1 $SEC)
	do 
		echo -en "\r$i"; 
		sleep 1; 
	done 
echo -en "\nYou have worked enough\n";
afplay /System/Library/Sounds/Glass.aiff; 
osascript -e 'tell app "System Events" to display dialog "Rest your eyes, then click ok to restart the timer" with title "Time to rest" ' >/dev/null 2>&1
if [ $? -eq 0 ]; then exec $0 $MIN; else exit 0; fi





