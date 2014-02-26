#!/bin/sh

filePath=$1
textToAdd=$2
afterThisText=$3

sed -e "s/$3/$3$2/g" $1