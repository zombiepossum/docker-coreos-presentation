#!/bin/sh


echo "/ncreating disk mount to joeServerDb\nCritcal Paths are"
echo "/etc/postgresql"
echo "/var/lib/postgresql"
echo "/var/log/postgresql"

docker run -rm --volumes-from joeServerDb -t -i busybox sh
