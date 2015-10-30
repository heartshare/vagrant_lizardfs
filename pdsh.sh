apt-get install pdsh

cat > /etc/profile.d/pdsh.sh <<EOF
# setup pdsh for cluster users
export PDSH_RCMD_TYPE='ssh'
export WCOLL='/etc/pdsh/machines'
EOF

mkdir -p /etc/pdsh
grep 10.0. /etc/hosts | awk '{print $2}' > /etc/pdsh/machines



