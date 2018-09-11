#!/bin/bash
directory="$1"
cd $directory

cat *| sed -r 's/ \<invalid user\>//g' | sed -r 's/:[0-9]+:[0-9]+//g' | awk '{print $1, $2, $3, $9, $11}' > test_log.txt
