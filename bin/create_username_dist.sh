#!/bin/bash

#Colin Rabe and Elizabeth Stevens
#University of Minnesota Morris
#September 2018

log_directory=$1
temp=$(mktemp)
temp2=$(mktemp)
here=$(pwd)
cd $log_directory 

# Recursively search the subdirectories for the file below and writes contents to temp
find -type f -name 'failed_login_data.txt' -exec cat {} >> $temp \;

# Prints the username column from temp, sorts and counts the resulting names
awk '{print $4}' $temp | sort | uniq -c |

	# Wraps the names and counts into google chart addRow syntax	
	awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > $temp2

rm $temp
cd $here

# Calls wrap_contents on addRow data to be wrapped in the required html header and footer
bash bin/wrap_contents.sh $temp2 html_components/username_dist $log_directory/username_dist.html

rm $temp2
