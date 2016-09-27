MariaDB 10.1 Galera Cluster using Docker
========================================

Spins up a usable Galera Cluster easily...

Consumption
-----------
Spin up using `docker-compose`:
```
docker-compose up -d --build
```

Included `docker-compose.yml`:
```
version: '2'
services:
  node1:
    build: "./"
    image: "etsbv-mariadb"
    environment:
      - MYSQL_ROOT_PASSWORD=dbcluster
      - MYSQL_REPLICATION_PASSWORD=dbcluster
      - MYSQL_CLUSTER_ADDRESS=
  node2:
    image: "etsbv-mariadb"
    depends_on:
      - "node1"
    environment:
      - MYSQL_ROOT_PASSWORD=dbcluster
      - MYSQL_REPLICATION_PASSWORD=dbcluster
      - MYSQL_CLUSTER_ADDRESS=node2
      - MYSQL_CLUSTER_PRIMARY_NODE=node1
  node3:
    image: "etsbv-mariadb"
    depends_on:
      - "node1"
      - "node2"
    environment:
      - MYSQL_ROOT_PASSWORD=dbcluster
      - MYSQL_REPLICATION_PASSWORD=dbcluster
      - MYSQL_CLUSTER_ADDRESS=node3
      - MYSQL_CLUSTER_PRIMARY_NODE=node1
```
