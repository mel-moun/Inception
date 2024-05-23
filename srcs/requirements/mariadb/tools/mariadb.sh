#!/bin/sh

maria_USER='Meriem'
maria_PASSWORD='INCEPTION'
maria_ROOT_PASSWORD='Bullshit'
MARIADB_DATABASE='mery'

service mariadb start

until mysqladmin ping -h localhost --silent; do
  sleep 1
done

mysql <<EOF
CREATE USER '$maria_USER'@'%' IDENTIFIED BY '$maria_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$maria_USER'@'%' IDENTIFIED BY '$maria_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$maria_ROOT_PASSWORD';
FLUSH PRIVILEGES;
CREATE DATABASE $MARIADB_DATABASE;
EOF

service mariadb stop

exec mysqld
