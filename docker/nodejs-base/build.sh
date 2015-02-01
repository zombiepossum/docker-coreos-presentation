#! /bin/bash

docker build -t nodejs-base .

docker tag -f nodejs-base jmuraski/nodejs-base

docker push jmuraski/nodejs-base
