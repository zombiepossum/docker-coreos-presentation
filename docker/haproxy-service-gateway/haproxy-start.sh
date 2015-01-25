#!/bin/bash

#
# start.bash
#

set -eo pipefail

export HAPROXY="/etc/haproxy"
export PIDFILE="/var/run/haproxy.pid"
export CONFIG="haproxy.cfg"
export ERRORS="errors"

export ETCD_PORT=${ETCD_PORT:-4001}
export HOST_IP=${HOST_IP:-172.17.42}
export ETCD=$HOST_IP:$ETCD_PORT

if [ -a /run/rsyslogd.pid ]
  then
  kill -15 $(cat /run/rsyslogd.pid)
fi
service rsyslog restart

cd "$HAPROXY"

# Loop until confd has updated the nginx config
until confd -onetime -node $ETCD -config-file /etc/confd/conf.d/haproxy.toml; do
  echo "[haproxy]-$(date +%s)-waiting for confd to refresh haproxy from ETCD $ETCD"
  sleep 5
done

# Run confd in the background to watch the upstream servers
confd -interval 10 -node $ETCD -config-file /etc/confd/conf.d/haproxy.toml &
echo "[haproxy]-$(date +%s)-confd is listening for changes on etcd $ETCD..."

# Create log files
mkdir -p /var/log/haproxy
chown syslog:adm /var/log/haproxy
touch /var/log/haproxy/haproxy.log
chown syslog:adm /var/log/haproxy/haproxy.log
touch /var/log/haproxy/haproxy-status.log
chown syslog:adm  /var/log/haproxy/haproxy-status.log

haproxy -f /etc/haproxy/haproxy.cfg -p "$PIDFILE"


# Tail all nginx log files
echo "tailing logs"
tail -F /var/log/haproxy/haproxy.log -F /var/log/haproxy/haproxy-status.log
