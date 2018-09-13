#!/bin/bash

log_directory=$1
here=$(pwd)
cd $log_directory

# Recursively search the subdirectories for the file below and writes contents to temp
find -type f -name 'failed_login_data.txt' -exec cat {} >> temp.txt \;

# Prints the time column from temp, sorts and counts the resulting times
awk '{print $3}' temp.txt | sort | uniq -c |
	
	# Wraps the times and counts into google chart addRow syntax  
	awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > temp2.txt

rm temp.txt
cd $here

# Calls wrap_contents on addRow data to be wrapped in the required html header and footer
bash bin/wrap_contents.sh $log_directory/temp2.txt html_components/hours_dist $log_directory/hours_dist.html

rm $log_directory/temp2.txt

