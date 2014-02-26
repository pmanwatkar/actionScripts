folder1=${1?" must specify folder with full path ex. /root/abc1 "}
folder2=${2?" must specify folder wirh full path ex. /root/abc2 "}


cp -R "$folder1" "folder2"
