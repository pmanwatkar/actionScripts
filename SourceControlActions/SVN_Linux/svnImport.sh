#!/bin/sh

sourceProjectPath=$1
repoProjectPath=$2
message="'"$3"'"


svn import $sourceProjectPath $repoProjectPath -m $message