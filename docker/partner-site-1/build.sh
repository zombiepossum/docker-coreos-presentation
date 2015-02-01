#! /bin/bash

docker build -t partner1-content .

docker tag -f partner1-content jmuraski/partner1-content

docker push  jmuraski/partner1-content
