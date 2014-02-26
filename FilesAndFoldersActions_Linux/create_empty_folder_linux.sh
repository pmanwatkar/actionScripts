# Creates an empty folder at requested location

P=${1? " Folder name with full path, ex. /path/to/folder "}


if [ -e "$P" ];

then

mkdir "$P"

else

echo "Destination location does not exist/ or don't have permission to create"

fi

