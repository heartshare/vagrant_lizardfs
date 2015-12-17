#!/bin/sh
version=3.9.2
distro=el7
yum install -y gcc gcc-c++ fuse-devel cmake zlib-devel asciidoc rpm-build
mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
wget https://github.com/lizardfs/lizardfs/archive/v$version.tar.gz
cp v$version.tar.gz ~/rpmbuild/SOURCES/lizardfs-$version.tar.gz
tar xvzf v$version.tar.gz
cp lizardfs-$version/rpm/lizardfs.spec ~/rpmbuild/SPECS
sed -i "s+@DISTRO@+$distro+g" ~/rpmbuild/SPECS/lizardfs.spec
rpmbuild -ba ~/rpmbuild/SPECS/lizardfs.spec


