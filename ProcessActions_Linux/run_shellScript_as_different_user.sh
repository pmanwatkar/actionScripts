#!/bin/sh

user=$1
scriptPath=$2

su $user -c "sh $scriptPath"
