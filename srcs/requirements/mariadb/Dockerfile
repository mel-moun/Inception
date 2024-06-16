FROM debian:bookworm

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y mariadb-server \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/mariadb.sh /usr/local/bin/

RUN mkdir -p /var/run/mysqld/ \
&& chown -R mysql:mysql /var/run/mysqld/

RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT [ "sh", "/usr/local/bin/mariadb.sh" ]
