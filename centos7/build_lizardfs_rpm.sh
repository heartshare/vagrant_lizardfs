#!/bin/sh

if ls ./lizardfs/lizardfs*.rpm 1> /dev/null 2>&1; then
    echo "rpm is ready"
else
    yum install -y git redhat-lsb-core rpm-build gcc gcc-c++ fuse-devel cmake zlib-devel asciidoc 
    git clone https://github.com/lizardfs/lizardfs
    cd lizardfs

    if ls ./lizardfs*.rpm 1> /dev/null 2>&1; then
	echo "rpm is ready"
    else
	./create-rpm-package.sh
    fi
fi



