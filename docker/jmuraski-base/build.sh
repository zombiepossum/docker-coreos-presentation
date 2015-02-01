#! /bin/bash

docker build -t jmuraski-base .

docker tag -f jmuraski-base jmuraski/jmuraski-base

docker push jmuraski/jmuraski-base
