#! /bin/bash

docker build -t endpoint-haproxy .

docker tag endpoint-haproxy jmuraski/endpoint-haproxy

docker push jmuraski/endpoint-haproxy
