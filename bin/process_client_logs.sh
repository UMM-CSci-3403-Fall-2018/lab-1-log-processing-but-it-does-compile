#!/bin/bash

#This script opens the given directory and
#goes into the files var/log to access the
#log files. Then searches all files for the
#string "Failed password" and removes the string
#"invalid user". After that it removes the 
#digits after the colons and stores the wanted data
#in the given directory into `failed_login_data.txt`

directory="$1"

cd $directory/var/log

cat *|grep "Failed password"| sed -r 's/ \<invalid user\>//g' | sed -r 's/:[0-9]+:[0-9]+//g' | awk '{print $1, $2, $3, $9, $11}' > $directory/failed_login_data.txt

