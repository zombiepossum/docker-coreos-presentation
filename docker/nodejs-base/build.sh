#! /bin/bash

docker build -t nodejs-base .

docker tag nodejs-base jmuraski/nodejs-base

docker push jmuraski/nodejs-base
