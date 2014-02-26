#This action changes the owner of the specified file or folder. This action will work on Linux or UNIX systems only.
#Input Values
#Mandatory
# File Name ( String )
#	 Path to the file or folder to change its owner.
# New Owner ( String )
#	 New owner user name.


P=${1?" Path to the file or folder to change its owner is missing. Ex. /var/log/messages"}
Q=${2?" New owner user name is missing."}

chown "$P" "$Q"
