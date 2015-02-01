#!/bin/bash

KEY_PATH=${KEY_PATH:-"unknown"}
KEY_ROOT=${KEY_ROOT:- "unknown"}
INSTANCE_NAME=${INSTANCE_NAME:-"unknown"}
INSTANCE_NUMBER=${INSTANCE_NUMBER:-1}
INSTANCE_PORT=${INSTANCE_PORT:-80}
INSTANCE_IP=${INSTANCE_IP:-127.0.0.1}
TTL=${TTL:-30}
SLEEP=${SLEEP:-20}
ETCD_PORT=${ETCD_PORT:-4001}
ETCD_IP=${ETCD_IP:-$INSTANCE_IP}
EXTRA_ARGS=${EXTRA_ARGS:-""}
REWRITE_URL=${REWRITE_URL:-"false"}
LOAD_BALANCE=${LOAD_BALANCE:-"roundrobin"}
HEALTH_CHECK=${HEALTH_CHECK:-"false"}

ETCD=$ETCD_IP:$ETCD_PORT
INSTANCE=${INSTANCE:-"$INSTANCE_NAME$INSTANCE_NUMBER"}
KEY="/$KEY_ROOT/$KEY_PATH/$INSTANCE"

echo "KEY_ROOT: $KEY_ROOT"
echo "KEY_PATH: $KEY_PATH"
echo "INSTANCE_NAME: $INSTANCE_NAME"
echo "INSTANCE_NUMBER: $INSTANCE_NUMBER"
echo "INSTANCE_PORT: $INSTANCE_PORT"
echo "INSTANCE_IP: $INSTANCE_IP"
echo "TTL: $TTL"
echo "SLEEP: $SLEEP"
echo "ETCD_PORT: $ETCD_PORT"
echo "ETCD_IP: $ETCD_IP"
echo "ETCD_IP: $ETCD_IP"
echo "ETCD: $ETCD"
echo "INSTANCE: $INSTANCE"
echo "KEY: $KEY"
echo "EXTRA_ARGS: $EXTRA_ARGS"
echo "REWRITE_URL: $REWRITE_URL"
echo "LOAD_BALANCE: $LOAD_BALANCE"
echo "HEALTH_CHECK: $HEALTH_CHECK"

# Loop to send key to ETCD - should key path be completely configured
while true; do
  curl -sIL --connect-timeout 5 -m 10 -w "%{http_code}" $INSTANCE_IP:$INSTANCE_PORT -o /dev/null;
  if [ $? -eq 0 ]; then
    echo "registering key $INSTANCE";
    etcdctl --peers $ETCD set $KEY "{\"host\": \"$INSTANCE\", \"ip\": \"$INSTANCE_IP\", \"port\": \"$INSTANCE_PORT\", \"extraArgs\": \"$EXTRA_ARGS\", \"rewriteUrl\": \"$REWRITE_URL\", \"loadBalance\": \"$LOAD_BALANCE\",  \"healthCheck\": \"$HEALTH_CHECK\"}" --ttl $TTL;
  else
    echo "curl failed removing key $INSTANCE";
    etcdctl --peers $ETCD rm $KEY;
  fi;
  sleep $SLEEP;
done
