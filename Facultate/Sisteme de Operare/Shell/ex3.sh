#1/bin/bash


N=$1

for I in $(seq 1 $N)
do
	touch "file_$I.txt"
	sed -n ''$I',+4p' |
