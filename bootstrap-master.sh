#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# copy examples into /home/vagrant (from inside the mgmt node)
#cp -a /vagrant/examples/* /home/vagrant
#chown -R vagrant:vagrant /home/vagrant

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.15.10  master # mfsmaster is virtual ip xxxx.15.12 
10.0.15.11  shadow
10.0.15.15  meta
10.0.15.16  cgi
10.0.15.21  chunk1
10.0.15.22  chunk2
EOL
apt-get install pdsh

cat > /etc/profile.d/pdsh.sh <<EOF
# setup pdsh for cluster users
export PDSH_RCMD_TYPE='ssh'
export WCOLL='/etc/pdsh/machines'
EOF

mkdir -p /etc/pdsh
grep 10.0. /etc/hosts | awk '{print $2}' > /etc/pdsh/machines



