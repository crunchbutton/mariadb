#!/bin/bash

docker rm -f docker-mariadb-galera
docker rm -f master
docker rm -f slave
docker build -f Dockerfile -t docker-mariadb-galera .
docker run -d -v /data --name dbdata -p 222:22 ubuntu sleep 2147483647

docker run --volumes-from dbdata -p 3308:3306 -d -e MYSQL_USER=devin -e MYSQL_PASS=root --name db1 -d docker-mariadb-galera /bin/start master
docker run -p 3307:3306 --name db2 --link db1 -e MYSQL_USER=devin -e MYSQL_PASS=root -d docker-mariadb-galera /bin/start node db1
