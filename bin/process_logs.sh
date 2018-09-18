#!/bin/bash

#Elizabeth Stevens and Colin Rabe
#University of Minnesota Morris
#September 2018

tempDir=$(mktemp -d)
here=$(pwd)

# Loops through all given files, untars them and generates failed login data for each
for var in "$@";
do
	mkdir -p $tempDir/${var%_*}
	tar -zxf $var -C $tempDir/${var%_*}
	./bin/process_client_logs.sh $tempDir/${var%_*}
done

# Generates html files for each characteristic of the failed login data, assmebles them
./bin/create_username_dist.sh $tempDir
./bin/create_hours_dist.sh $tempDir
./bin/create_country_dist.sh $tempDir
./bin/assemble_report.sh $tempDir

# Moves the summary html file out of the temporary directory
mv $tempDir/failed_login_summary.html $here
rm -rf $tempDir
