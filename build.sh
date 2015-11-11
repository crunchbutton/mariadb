#!/bin/bash

docker rm -f docker-mariadb-galera
docker build -f Dockerfile -t docker-mariadb-galera .
docker run -d -v /data --name db_vol -p 222:22 ubuntu sleep 2147483647

docker run --volumes-from db_vol -p 3308:3306 --name master -d docker-mariadb-galera /bin/start master
docker run -p 3307:3306 --name slave --link master:master -d docker-mariadb-galera /bin/start node master
#-v /data:/data

#docker run -p 3308:3306 --name ubuntu ubuntu /bin/bash
