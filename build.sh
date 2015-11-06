#!/bin/bash

docker rm -f docker-mariadb-galera
docker build -f Dockerfile -t docker-mariadb-galera .
docker run -p 3308:3306 --name master --hostname master -v /data:/data  -d docker-mariadb-galera /bin/start master
#docker run -p 3307:3306 --name slave --link master:master -d docker-mariadb-galera /bin/start node 172.17.0.2
#-v /data:/data

#docker run -p 3308:3306 --name ubuntu ubuntu /bin/bash
