# vagrant_lizardfs


```
git clone this repository

$vagrant up
$vagrant ssh master

$cd /vagrant; ./ssh.sh
$ansible-playbook role-common.yml --ask-pass (passwd:vagrant)
$ansible-playbook role-master.yml
$ansible-playbook role-shadow.yml
$ansible-playbook role-chunk.yml
$ansible-playbook role-meta.yml
$ansible-playbook role-cgi.yml
$ansible-playbook role-client.yml

in case of master server crash
master -> shadow failover is managed by keepalived

run test:
$pdsh -w chunk1,chunk2 < test

chunk2: 52428800 bytes (52 MB) copied, 1.39275 s, 37.6 MB/s
chunk1: 50+0 records in
chunk1: 50+0 records out
chunk1: 52428800 bytes (52 MB) copied, 1.66993 s, 31.4 MB/s
chunk2: 50+0 records in
chunk2: 50+0 records out
chunk2: 52428800 bytes (52 MB) copied, 2.54965 s, 20.6 MB/s
chunk1: 50+0 records in
chunk1: 50+0 records out
chunk1: 52428800 bytes (52 MB) copied, 2.38723 s, 22.0 MB/s
chunk2: 50+0 records in
chunk2: 50+0 records out
(snipped)

visit lizardfs gui monotor at:
http://10.0.15.21:9425/mfs.cgi?masterhost=mfsmaster

```
