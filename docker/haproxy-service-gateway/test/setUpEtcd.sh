#! /bin/bash

etcdctl set /endpoints/api/tomcat1 '{"extraArgs": "maxconn 32 check", "rewriteUrl": "false", "name": "tomcat1", "port": "1234", "loadBalance": "roundrobin", "ip": "111.111.222.222"}'
etcdctl set /endpoints/api/tomcat2 '{"extraArgs": "maxconn 32 check", "rewriteUrl": "false", "name": "tomcat2", "port": "1234", "loadBalance": "roundrobin", "ip": "222.11.22.010"}'
etcdctl set /endpoints/swagger/tomcat1 '{"extraArgs": "maxconn 32 check", "rewriteUrl": "false", "name": "tomcat1", "port": "1234", "loadBalance": "leastconnections", "ip": "111.111.222.222"}'
etcdctl set /endpoints/swagger/tomcat2 '{"extraArgs": "maxconn 32 check", "rewriteUrl": "false", "name": "tomcat2", "port": "1234", "loadBalance": "leastconnections", "ip": "222.11.22.010"}'
etcdctl set /endpoints/static/nginx1 '{"extraArgs": "maxconn 32 check", "rewriteUrl": "static", "name": "nginx1", "port": "2255", "loadBalance": "roundrobin", "ip": "111.111.222.222"}'
etcdctl set /endpoints/static/nginx2 '{"extraArgs": "maxconn 32 check", "rewriteUrl": "static", "name": "nginx2", "port": "4524", "loadBalance": "roundrobin", "ip": "12.25.45.87"}'

etcdctl set /services/address/address1 '{"extraArgs": "maxconn 32", "rewriteUrl": "/services/addresses/", "name": "address1", "port": "4000", "loadBalance": "roundrobin", "ip": "12.25.45.87", "healthCheck": "false"}'
etcdctl set /services/address/address2 '{"extraArgs": "maxconn 32", "rewriteUrl": "/services/addresses/", "name": "address2", "port": "4000", "loadBalance": "roundrobin", "ip": "12.25.45.88", "healthCheck": "false"}'
etcdctl set /services/user/user1 '{"extraArgs": "maxconn 32", "rewriteUrl": "/services/", "name": "user1", "port": "8080", "loadBalance": "roundrobin", "ip": "12.25.45.89", "healthCheck": "GET /health"}'
etcdctl set /services/user/user2 '{"extraArgs": "maxconn 32", "rewriteUrl": "/services/", "name": "user2", "port": "8080", "loadBalance": "roundrobin", "ip": "12.25.45.90", "healthCheck": "GET /health"}'
