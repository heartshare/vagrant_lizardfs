ssh-keygen -t rsa
for i in `grep 10.0 /etc/hosts | awk '{print $2}'`; do
    ssh-keyscan $i;
done > ~/.ssh/known_hosts
