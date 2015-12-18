#!/bin/bash
yum install epel-release -y
yum install ansible unzip -y
cat > /etc/ansible/hosts <<EOF 

[master]
master

[chunk]
chunk1
chunk2

[shadow]
shadow

[meta]
chunk1

[cgi]
chunk1

[client]
chunk1
chunk2

EOF

cat >> /etc/hosts <<EOF

# vagrant environment nodes
10.0.15.10  master # mfsmaster is virtual ip xxxx.15.12 
10.0.15.11  shadow

10.0.15.21  chunk1
10.0.15.22  chunk2

EOF

cat > /etc/profile.d/pdsh.sh <<EOF
export PDSH_RCMD_TYPE='ssh'
export WCOLL='/etc/pdsh/machines'
EOF

mkdir -p /etc/pdsh
grep 10.0. /etc/hosts | awk '{print $2}' > /etc/pdsh/machines

#./build_pdsh_rpm.sh

ssh-keygen -t rsa
for i in `grep 10.0.15 /etc/hosts | awk '{print $2}'`; do
    ssh-keyscan $i;
done > ~/.ssh/known_hosts

ansible-playbook ssh_key.yml --ask-pass 




