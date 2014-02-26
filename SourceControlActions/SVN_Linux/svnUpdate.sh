#!/bin/sh

pathOfProject=$1
revision=$2

cd $1; svn update -r$2
