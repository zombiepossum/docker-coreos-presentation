#! /bin/bash

docker build -t partner3-content .

docker tag -f partner3-content jmuraski/partner3-content

docker push  jmuraski/partner3-content
