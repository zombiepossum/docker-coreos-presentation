#! /bin/bash

etcdctl rm /endpoints/api/tomcat1
etcdctl rm /endpoints/api/tomcat2
etcdctl rm /endpoints/swagger/tomcat1
etcdctl rm /endpoints/swagger/tomcat2
etcdctl rm /endpoints/static/nginx1
etcdctl rm /endpoints/static/nginx2

etcdctl rmdir /endpoints/api
etcdctl rmdir /endpoints/swagger
etcdctl rmdir /endpoints/static
etcdctl rmdir /endpoints


etcdctl rm /services/address/address1
etcdctl rm /services/address/address2
etcdctl rm /services/user/user2
etcdctl rm /services/user/user2

etcdctl rmdir /services/address
etcdctl rmdir /services/user
etcdctl rmdir /services
