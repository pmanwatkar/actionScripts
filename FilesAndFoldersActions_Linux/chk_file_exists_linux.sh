# This action checks whether file or folder exists or not.

#!/bin/bash

P=${1?" must specify file name."}

#FILE=$1
 
if [ -f "$P" ];

then
   echo "File $P exists"

else
   echo "File $P does not exists"

fi
 

