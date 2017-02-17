A docker and docker compose script to booth up a galera cluster

---

### Setup

```bash
docker run -d -v /data:/data docker-mariadb-galera /bin/start master
docker run -d -v /data:/data docker-mariadb-galera /bin/start node 172.17.0.81
docker run -d -v /data:/data docker-mariadb-galera /bin/start node 172.17.0.81
```
