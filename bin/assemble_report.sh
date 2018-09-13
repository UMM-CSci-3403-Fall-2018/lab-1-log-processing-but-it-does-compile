#!/bin/bash

#Colin Rabe and Elizabeth Stevens
#University of Minnesota Morris
#September 2018

html_directory=$1
temp=$(mktemp)
here=$(pwd)
cd $html_directory

cat username_dist.html hours_dist.html country_dist.html > $temp
cd $here

bash bin/wrap_contents.sh $temp  html_components/summary_plots $html_directory/failed_login_summary.html

rm $temp
