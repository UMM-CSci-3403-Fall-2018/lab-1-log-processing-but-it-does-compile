#!/bin/bash

top_directory=$1

cd $top_directory
here=$(pwd)
cd bin/test_usernames
cat failed_login_data.txt| awk '{print $4}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > test.txt
cd $here
bash bin/wrap_contents.sh bin/test_usernames/test.txt html_components/username_dist username_dist.html

rm bin/test_usernames/test.txt
