#!/bin/sh

yum install -y git
git clone https://github.com/lizardfs/lizardfs
cd lizardfs

if ls ./lizardfs*.rpm 1> /dev/null 2>&1; then
 echo "rpm is ready"
else
 yum install -y redhat-lsb-core rpm-build gcc gcc-c++ fuse-devel cmake zlib-devel asciidoc git -y
 ./create-rpm-package.sh 
fi



