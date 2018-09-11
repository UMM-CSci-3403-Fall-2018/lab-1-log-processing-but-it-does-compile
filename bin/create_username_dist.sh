#!/bin/bash

top_directory=$1

cd $top_directory

cat failed_login_data.txt| awk '{print $4}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > test.txt

#bash /bin/wrap_contents.sh 
