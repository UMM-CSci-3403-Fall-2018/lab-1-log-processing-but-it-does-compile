#!/bin/bash

#Colin Rabe and Elizabeth Stevens
#University of Minnesota Morris
#September 2018

log_directory=$1
here=$(pwd)
cd $log_directory 

# Recursively search the subdirectories for the file below and writes contents to temp
find -type f -name 'failed_login_data.txt' -exec cat {} >> temp.txt \;

# Prints the username column from temp, sorts and counts the resulting names
awk '{print $4}' temp.txt | sort | uniq -c \

	# Wraps the names and counts into google chart addRow syntax	
	| awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > temp2.txt

rm temp.txt
cd $here

# Calls wrap_contents on addRow data to be wrapped in the required html header and footer
bash bin/wrap_contents.sh $log_directory/temp2.txt html_components/username_dist $log_directory/username_dist.html

rm $log_directory/temp2.txt
