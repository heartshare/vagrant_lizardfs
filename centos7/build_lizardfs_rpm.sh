#!/bin/sh

 yum install redhat-lsb-core rpm-build gcc gcc-c++ fuse-devel cmake zlib-devel asciidoc git -y
 git clone https://github.com/lizardfs/lizardfs
 cd lizardfs
./create-rpm-package.sh 



