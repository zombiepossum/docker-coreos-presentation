#! /bin/bash

docker build -t node-express-endpoint .

docker tag -f nodejs-express-endpoint jmuraski/node-express-endpoint

docker push jmuraski/node-express-endpoint
