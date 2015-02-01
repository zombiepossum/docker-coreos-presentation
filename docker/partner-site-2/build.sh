#! /bin/bash

docker build -t partner2-content .

docker tag -f partner2-content jmuraski/partner2-content

docker push  jmuraski/partner2-content
