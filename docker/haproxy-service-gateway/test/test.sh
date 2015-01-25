export ETCD_PORT=${ETCD_PORT:-4001}
export HOST_IP=${HOST_IP:-172.17.8.101}
export ETCD=$HOST_IP:$ETCD_PORT
export DIR=$(pwd)

confd -onetime -node $ETCD -config-file="conf.d/test.toml" -confdir $DIR

echo "************  Output File  ************"
cat testOut.txt
echo "************  End File  ************"
echo "Cleaning up intermediate files"
rm .testOut.txt*
rm testOut.txt
