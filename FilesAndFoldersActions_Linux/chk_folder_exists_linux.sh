# This action checks whether a folder exists or not.


#!/bin/bash

P=${1?" must specify folder name."}

#Folder="$P"
 
if [ -d "$P" ];
then
   echo "Folder $P exists"
else
   echo "Folder $P does not exists"
fi
 
