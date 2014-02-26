#!/bin/sh

filePath=$1
textAppendAtStart=$2

sed -i "1i$2" $1