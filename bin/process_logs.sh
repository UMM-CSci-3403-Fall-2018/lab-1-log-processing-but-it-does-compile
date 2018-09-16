#!bin/bash

tempDir=$(mktemp -d)

for var in "$@"
do
	tar -xzf $var -C ${var%_*}
	./bin/process_client_logs.sh ${var%_*}
done

rm -rf $tempDir
