#! /bin/bash

docker build -t service-gateway-haproxy .

docker tag -f service-gateway-haproxy jmuraski/service-gateway-haproxy

docker push jmuraski/service-gateway-haproxy
