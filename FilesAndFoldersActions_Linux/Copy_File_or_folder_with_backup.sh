
#Copy File o r Folder with Backup
#This action copies the specified file or folder from the source path to the target path. All files that are overwritten in
#the target path are saved in the folder specified by the backup path input. If this folder does not exist, it will be
#created.

P=${1?" source file name, ex. abc.sh,  For all files please type ALL "}
Q=${2?" source path ex. /root/ "}
R=${3?" destination file name, ex. abc1.sh, For all files please type ALL "}
S=${4?" destination path ex. /home/"}
T=${5?" target path to keep existing files ex. /root/foldername/ "}

#U="*"   # ${1?" source file name, ex. abc.sh "}
#V="*"   # ${3?" destination file name, name abc1.sh "}


#!/bin/bash


#echo "$P" "$Q" "$R" "$S" "$T"

if [ "$P" = 'ALL' ];
then
echo "For all files"
for P in $(ls "$Q/"); do 
if [ -e "$S/""$R" ];
then
	R="$P" 
#  echo "File $R already exists at destination location, so making its backup"

        if [ -d "$T" ];
        then
#   echo "Folder $T exists, taking backup"
        mv "$S/""$R" "$T/""$R"
        rm -rf "$S/""$R"
        cp -f "$Q/""$P" "$S/""$R"
        else
#   echo "Folder $T does not exists, so creating folder and then taking backup"
        mkdir -p "$T"
        mv "$S/""$R" "$T/""$R"
        rm -rf "$S/""$R"
        cp -f "$Q/""$P" "$S/""$R"
        fi

else
#   echo "File $R does not exists at destination folder, so copying without backup"
   cp -f "$Q/""$P" "$S/""$R"
fi
done
echo "Success"



else
 echo "For one file"

if [ -e "$S/""$R" ];
then
   echo "File $R already exists at destination location, so making its backup"

	if [ -d "$T" ];
	then
   echo "Folder $T exists, taking backup"
	mv "$S/""$R" "$T/""$R"
	rm -rf "$S/""$R" 
	cp -f "$Q/""$P" "$S/""$R"
	else
   echo "Folder $T does not exists, so creating folder and then taking backup"
	mkdir -p "$T"
	mv "$S/""$R" "$T/""$R"
	rm -rf "$S/""$R"
	cp -f "$Q/""$P" "$S/""$R"
	fi
 
else
   echo "File $R does not exists at destination folder, so copying without backup"
   cp -R "$Q/""$P" "$S/""$R"
fi
echo "success"

fi
exit 0
