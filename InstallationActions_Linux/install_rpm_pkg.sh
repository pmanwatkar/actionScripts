#!/bin/bash -

# @(#) user1    Demonstrate rpm query.

#uname -rv
#bash --version
#rpm --version

P=${1?" must specify package name.Ex. package_name=abc.x.x.x "}
Q=${2?" Path of the RPM package to install. Ex./root/home/"}

echo "$Q/""$P"
rpm -ivh "$Q/""$P"



exit 0
