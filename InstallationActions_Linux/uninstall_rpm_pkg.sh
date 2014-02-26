#!/bin/bash -

# @(#) user1    Demonstrate rpm query.

#uname -rv
#bash --version
#rpm --version

echo " This will uninstall a package with no dependency"
P=${1?" must specify package name."}

rpm -qa "$P" > t1
my_size=$( wc -l < t1 )
echo " Size of report file is $my_size lines"

if [[ $( rpm -qa $P ) =~ ${P} ]]
# if [[ $( rpm -qa $P ) == *${P}* ]]
then
  echo " Package $P is installed."

rpm -e --noscript --nodeps "$p" 

  echo " Package $P is uninstalled."
else
  echo " Package $P not found."
fi

exit 0

