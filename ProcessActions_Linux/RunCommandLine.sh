#!/bin/sh

CMD=$1
DIR=$2
BACKGROUND=$3
 
if [ $BACKGROUND == "Yes" ]
then
    cd $PWD
    CMD &
else
    cd $PWD
    CMD
fi