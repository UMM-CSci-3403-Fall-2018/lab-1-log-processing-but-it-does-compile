#!/bin/bash

log_directory=$1
here=$(pwd)

cd $log_directory 

find -type f -name 'failed_login_data.txt' -exec cat {} >> temp.txt \;
awk '{print $4}' temp.txt | sort | uniq -c \
	| awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > temp2.txt

rm temp.txt
cd $here



bash bin/wrap_contents.sh $log_directory/temp2.txt html_components/username_dist $log_directory/username_dist.html

rm $log_directory/temp2.txt

#rm $log_directory/test.txt
