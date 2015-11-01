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

run test:
$pdsh -w cgi,meta < test

meta: 50+0 records in
pdsh> meta: 50+0 records out
meta: 52428800 bytes (52 MB) copied, 1.88863 s, 27.8 MB/s
cgi: 50+0 records in
cgi: 50+0 records out
cgi: 52428800 bytes (52 MB) copied, 1.96903 s, 26.6 MB/s
meta: 50+0 records in
meta: 50+0 records out
meta: 52428800 bytes (52 MB) copied, 1.99914 s, 26.2 MB/s
cgi: 50+0 records in
cgi: 50+0 records out
cgi: 52428800 bytes (52 MB) copied, 1.9183 s, 27.3 MB/s
meta: 50+0 records in
meta: 50+0 records out
meta: 52428800 bytes (52 MB) copied, 1.93202 s, 27.1 MB/s
cgi: 50+0 records in
cgi: 50+0 records out
cgi: 52428800 bytes (52 MB) copied, 1.99845 s, 26.2 MB/s
cgi: 50+0 records in
cgi: 50+0 records out
cgi: 52428800 bytes (52 MB) copied, 1.98519 s, 26.4 MB/s
meta: 50+0 records in
meta: 50+0 records out
meta: 52428800 bytes (52 MB) copied, 2.17126 s, 24.1 MB/s
meta: 50+0 records in
meta: 50+0 records out
meta: 52428800 bytes (52 MB) copied, 1.9173 s, 27.3 MB/s
cgi: 50+0 records in
cgi: 50+0 records out
cgi: 52428800 bytes (52 MB) copied, 2.02597 s, 25.9 MB/s

visit lizardfs gui monotor at:
http://10.0.15.16:9425/mfs.cgi?masterhost=mfsmaster

master -> shadow failover is managed by keepalived

```
