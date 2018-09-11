#!/usr/bin/bash
#Wraps given text in the header and footer provided,
#overwriting the given file, if it exists.

#Elizabeth Stevens
#University of Minnesota Morris
#September 201

middle=$1
head_foot_name=$2
new_file=$3

cat $head_foot_name"_header.html" > $new_file
cat $middle >> $new_file
cat $head_foot_name"_footer.html" >> $new_file

