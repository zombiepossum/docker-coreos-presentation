#! /bin/bash

docker build -t debian-base .

docker tag  debian-base jmuraski/debian-base

docker push jmuraski/debian-base
