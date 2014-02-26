#Change Mode of File or Folder
#This action performs a change mode operation on the specified file or folder. This action supports Unix/Linux systems only.

#Mendatory: Mode number to which to change the file or folder.
#Path to the file or folder on which to change the mode. Can set explicit values or use the File parameter.

P=${1?"  Mode number to which to change the file or folder is missing."}
Q=${2?" Path to the file or folder on which to change the mode is missing."}


chmod "$P" "$Q"


