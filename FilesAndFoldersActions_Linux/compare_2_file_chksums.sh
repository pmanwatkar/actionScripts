P=${1?" first file with path, ex. root/abc.sh "}
Q=${2?" second file with path, ex. root/abc.sh "}


#cd "$P"
find . -type f | sort | cksum >1.txt

#cd "$Q"
find . -type f | sort | cksum >2.txt

diff -w 1.txt 2.txt

#abc= $[diff -w 1.txt 2.txt]
#echo $abc


rm -rf 1.txt 2.txt
