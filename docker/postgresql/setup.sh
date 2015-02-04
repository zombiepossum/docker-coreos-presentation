#!/bin/sh

./build.sh
boot2docker halt
./mapPorts.sh
boot2docker up
./createContainer.sh
./run.sh
