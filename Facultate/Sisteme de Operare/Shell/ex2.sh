#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Nu ati introdus suficienti parametri"
	exit 1
fi

for NUME in $*
do
	if [ -d $NUME ]
	then
		echo 'Director:' $NUME
		NF=$(find $NUME -type f | grep -c '.')
		echo 'Numar fisiere:' $NF
	elif [ -f $NUME ]
	then
		echo $nume
		echo $(wc -l <$NUME)
		echo $(wc -m <$NUME)
	else
		echo NU este fisier sau plm 
	fi
done

exit 0

