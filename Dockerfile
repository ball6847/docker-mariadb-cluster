FROM mariadb:10
MAINTAINER Porawit Poboonma <ball6847@gmail.com>

ENV MYSQL_CLUSTER_ADDRESS="" \
    WSREP_CLUSTER_NAME="dbcluster" \
    MYSQL_CLUSTER_PRIMARY_NODE="node1"

RUN apt-get update && \
    apt-get install -y --no-install-recommends netcat && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD docker-entrypoint.sh /docker-entrypoint.sh
ADD conf.d/00-galera.cnf /etc/mysql/conf.d/00-galera.cnf

EXPOSE 3306 4444 4567 4568
