## MariaDB 10.1 Galera Cluster using Docker

1 build image

```
docker-compose -f docker-compose.node1.yml build
```

2 start node1 as primary node

```
docker-compose -f docker-compose.node1.yml up -d
```

3 join node 2 to cluster

```
docker-compose -f docker-compose.node2.yml up -d
```

4 join node 3 to cluster

```
docker-compose -f docker-compose.node3.yml up -d
```
