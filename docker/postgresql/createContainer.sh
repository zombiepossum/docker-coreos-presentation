#!/bin/sh

docker create -p 49155:5432 -P --name joeServerDb jmuraski/postgresql
