#! /bin/bash

docker build -t etcd_service_register .

docker tag -f etcd_service_register  jmuraski/etcd_service_register

docker push jmuraski/etcd_service_register
