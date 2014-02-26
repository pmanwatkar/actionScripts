
#!/bin/bash -

#Retrieve Ins talled RPM Package Name by RPM File
#This action retrieves the RPM package name from an RPM file.
#Note: This action supports only systems that support RPM packages.

# @(#) user1    Demonstrate rpm query.

#uname -rv
#bash --version
#rpm --version

echo
P=${1?" must specify name of file of package(full path Ex./root/home/mysql )."}


rpm -qf "$P"
#rpm -qf "$P" > new.sh

#cat new.sh
#if [[ $(cat new.sh |grep error) =~ 'error']]

#then
#  echo " Package with file is not installed."
#else
#  echo " File $P is in Package."
#fi

#rm -r new.sh

exit 0
