#!/bin/bash
directory="$1"
cd $directory

cat *| sed -r 's/ \<invalid user\>//g' | sed -r 's/:[0-9]+:[0-9]+//g' > test_log.txt
