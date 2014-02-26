#!/bin/sh

userName=$1
processName=$2

while pgrep -u $userName $processName > /dev/null; do sleep 1; done 
