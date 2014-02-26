#!/bin/bash

ping -c 3 $1 > /dev/null

OUT=$?

if [ $OUT -eq 0 ];then

	echo "device is pingable"
else 
	echo "divice is not pingable."
fi
