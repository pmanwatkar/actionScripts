# Creates an empty file at requested location

P=${1? " File name with full path, ex. /path/to/file "}


if [ -e "$P" ];

then

touch "$P"

else 

echo "Destination location does not exist/ or don't have permission to create"

fi
