#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Nu ati oferit sufucienti parametri"
	exit 1
fi

N=$1

for i in $(seq 1 $N)
do
	touch "file_$i.txt"
	sed -n ''$i',+5p' /etc/passwd > "file_$i.txt"
done

