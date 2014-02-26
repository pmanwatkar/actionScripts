#!/bin/sh

pathOfProject=$1
message="'"$2"'"


cd $pathOfProject; svn commit -m $message