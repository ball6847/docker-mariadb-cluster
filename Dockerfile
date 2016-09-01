FROM mariadb:10
MAINTAINER Porawit Poboonma <ball6847@gmail.com>

ENV TERM=xterm-256color

ADD docker-entrypoint.sh /docker-entrypoint.sh
ADD conf.d/00-galera.cnf /etc/mysql/conf.d/00-galera.cnf

EXPOSE 3306 4444 4567 4568
