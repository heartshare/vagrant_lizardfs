#!/bin/sh
version=3.9.4
#some stupid confusion of v.$version and $version in tar files

distro=el7
if ls ./lizardfs_el7/lizardfs*.rpm 1> /dev/null 2>&1; then
    echo  "rpm is ready"
else
    yum install -y gcc gcc-c++ fuse-devel cmake zlib-devel asciidoc rpm-build
    mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
    wget https://github.com/lizardfs/lizardfs/archive/v.$version.tar.gz
    cp v.$version.tar.gz ~/rpmbuild/SOURCES/lizardfs-v.$version.tar.gz
    tar xvzf v.$version.tar.gz
    cp lizardfs-v.$version/rpm/lizardfs.spec ~/rpmbuild/SPECS
    sed -i "s+@DISTRO@+$distro+g" ~/rpmbuild/SPECS/lizardfs.spec
    sed -i "s+3.9.4+v.3.9.4+g" ~/rpmbuild/SPECS/lizardfs.spec
    rpmbuild -ba ~/rpmbuild/SPECS/lizardfs.spec

    mkdir -p lizardfs_el7
    cp ~/rpmbuild/RPMS/x86_64/lizardfs*.rpm lizardfs_el7/
fi


