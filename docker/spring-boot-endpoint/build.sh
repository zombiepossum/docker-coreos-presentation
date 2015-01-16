#! /bin/bash

docker build -t spring-boot-endpoint .

docker tag  spring-boot-endpoint jmuraski/spring-boot-endpoint

docker push jmuraski/spring-boot-endpoint
