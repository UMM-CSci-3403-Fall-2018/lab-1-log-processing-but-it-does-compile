#!/bin/bash

# Colin Rabe and Elizabeth Stevens
# University of Minnesota
# September 2018

directory="$1"

cd $directory/var/log

# Reads log files, deletes 'invalid user' from lines that contain 'Failed password'
cat *|grep "Failed password"| sed -r 's/ \<invalid user\>//g' \

	# Removes Minutes and seconds from the time, prints the required columns
	| sed -r 's/:[0-9]+:[0-9]+//g' | awk '{print $1, $2, $3, $9, $11}' \
       
	> $directory/failed_login_data.txt

