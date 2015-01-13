#! /bin/bash

docker build -t endpoint-haproxy .

docker tag endpoint-haproxy quay.io/jmuraski/endpoint-haproxy

docker push quay.io/jmuraski/endpoint-haproxy
