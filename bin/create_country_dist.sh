#!/bin/bash

#Colin Rabe and Elizabeth Stevens
#University of Minnesota Morris
#September 2018

log_directory=$1
temp=$(mktemp)
temp2=$(mktemp)
here=$(pwd)
cd $log_directory

# Recursively search the subdirectories for the file below and writes contents to temp
find -type f -name 'failed_login_data.txt' -exec cat {} >> $temp \;

# Prints the IP column from temp, sorts the results and stores them in temp2
awk '{print $5}' $temp | sort > $temp2 
cd $here

# Joins the sorted IP's from temp2 with their country codes, sorts and counts the codes
join etc/country_IP_map.txt $temp2 | awk '{print $2}' | sort | uniq -c |

	# Wraps the country codes and their counts into google chart addRow syntax    
        awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > $temp

# Calls wrap_contents on addRow data to be wrapped in the required html header and footer
bash bin/wrap_contents.sh $temp html_components/country_dist $log_directory/country_dist.html

rm $temp
rm $temp2
