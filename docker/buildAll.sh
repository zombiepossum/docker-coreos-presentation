#! /bin/bash

echo "***************  BUILDING BASE "
cd jmuraski-base

./build.sh

echo "***************  BUILDING NODE BASE "
cd ../nodej-base

./build.sh

echo "***************  BUILDING HAPROXY SERVICE GATEWAY "
cd ../haproxy-service-gateway

./build.sh

echo "***************  BUILDING HAPROXY ENDPOINT PROXY "
cd ../haproxy-endpoint-proxy

./build.sh

echo "***************  BUILDING NODE API GATEWAY "
cd ../node-api-gateway

./build.sh

echo "***************  BUILDING NODE EXPRESS ENDPOINT "
cd ../node-express-endpoint

./build.sh

echo "***************  BUILDING REGISTER SERVICE"
cd ../registerService

./build.sh

echo "***************  BUILDING SPRING BOOT ENDPOINT"
cd ../spring-boot-endpoint

./build.sh

echo "***************  BUILDING Partner Site 1"
cd ../partner-site-1

./build.sh

echo "***************  BUILDING Partner Site 2"
cd ../partner-site-2

./build.sh

echo "***************  BUILDING Partner Site 3"
cd ../partner-site-3

./build.sh
