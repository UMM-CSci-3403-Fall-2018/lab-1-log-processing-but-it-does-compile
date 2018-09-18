#!/bin/bash

#Colin Rabe and Elizabeth Stevens
#University of Minnesota Morris
#September 2018

html_directory=$1
temp=$(mktemp)
here=$(pwd)
cd $html_directory

# Appends the content of the html files together
cat country_dist.html hours_dist.html username_dist.html > $temp
cd $here

# Wraps their contents in summary header and footer
bash bin/wrap_contents.sh $temp  html_components/summary_plots $html_directory/failed_login_summary.html

rm $temp
