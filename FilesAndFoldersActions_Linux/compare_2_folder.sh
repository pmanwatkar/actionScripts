folder1=${1?" must specify folder with full path ex. /root/abc1 "}
folder2=${2?" must specify folder wirh full path ex. /root/abc2 "}


cd "$folder1"
find . -type f | sort | cksum > /root/1.sh

cd "$folder2"
find . -type f | sort | cksum > /root/2.sh

diff -w /root/1.sh /root/2.sh

rm -rf /root/1.sh /root/2.sh
