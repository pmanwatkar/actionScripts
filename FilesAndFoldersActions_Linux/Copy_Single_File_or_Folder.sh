
P=${1?" source file/folder with path, ex. /root/abc.sh "}
Q=${2?" destination file/folder with path path ex. /root/abc "}

if [ -e "$P" ];

then 

cp "$P" "$Q"

else

echo "Source file/folder does not exists"

fi
