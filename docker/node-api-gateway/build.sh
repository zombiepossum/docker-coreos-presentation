#! /bin/bash

docker build -t node-api-gateway .

docker tag -f node-api-gateway jmuraski/node-api-gateway

docker push jmuraski/node-api-gateway
