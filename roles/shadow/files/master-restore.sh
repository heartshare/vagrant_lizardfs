#!/bin/sh
sed -i 's+PERSONALITY = shadow+PERSONALITY = master+g' /etc/mfs/mfsmaster.cfg
mfsmaster reload

