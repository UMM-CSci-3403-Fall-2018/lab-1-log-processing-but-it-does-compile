#!/bin/bash
directory="$1"
cd $directory

cat *| sed -r 's/ \<invalid user\>//g' > test_log.txt
