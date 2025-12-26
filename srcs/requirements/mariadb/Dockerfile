FROM debian:bookworm-slim

RUN apt-get update && apt-get -y install mariadb-server

COPY tools/ /docker-entrypoint-initdb.d/

EXPOSE 3306

RUN chmod +x /docker-entrypoint-initdb.d/*.sh

CMD ["mysqld"]
