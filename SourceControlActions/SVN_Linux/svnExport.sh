#!/bin/sh

pathWhereToDownload=$1
svnRepoPath=$2
userRepo=$3
password=$4

cd $pathWhereToDownload; svn export $svnRepoPath --username $userRepo --password $password
