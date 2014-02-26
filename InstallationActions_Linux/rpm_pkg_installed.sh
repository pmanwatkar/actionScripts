#!/bin/bash -

# @(#) user1    Demonstrate rpm query.

#uname -rv
#bash --version
#rpm --version

echo
P=${1?" must specify package name."}

rpm -qa "$P" > t1
my_size=$( wc -l < t1 )
echo " Size of report file is $my_size lines"

if [[ $( rpm -qa $P ) =~ ${P} ]]
# if [[ $( rpm -qa $P ) == *${P}* ]]
then
  echo " Package $P is installed."
else
  echo " Package $P not found."
fi

exit 0
