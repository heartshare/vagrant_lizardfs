# vagrant_lizardfs


```
git clone this repository

$vagrant up
$vagrant ssh mfsmaster
$cd /vagrant; ./ssh.sh
$ansible-playbook role-common.yml
$ansible-playbook role-master.yml
$ansible-playbook role-shadow.yml
$ansible-playbook role-chunk.yml
$ansible-playbook role-meta.yml
$ansible-playbook role-cgi.yml
$ansible-playbook role-client.yml

visit lizardfs gui monotor at:
http://10.0.15.16:9425/mfs.cgi?masterhost=mfsmaster

```
