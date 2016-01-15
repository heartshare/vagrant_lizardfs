# vagrant_lizardfs


```
git clone this repository

$vagrant up
$vagrant ssh master

$cd /vagrant;
$su
#./deploy.sh

#ansible-playbook role-lizardfs.yml

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


in case of master server crash
master -> shadow failover is managed by keepalived

test the failover:

on master
# kill $(pidof mfsmaster)
# ip a (now the mfsmaster virtual ip should be handed to shadow)

ssh to shadow
# ip a (shadow now has the mfsmaster virtual ip, and the PERSONALITY in /etc/mfs/mfsmaster.cfg is set to master)

to restore master/shadow:

on master:
# mfsmetarestore -a
# mfsmaster restart

on shadow:
# sed -i 's+PERSONALITY = master+PERSONALITY = shadow+g' /etc/mfs/mfsmaster.cfg
# mfsmaster restart

```
