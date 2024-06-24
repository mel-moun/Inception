#!/bin/sh

maria_ROOT_PASSWORD=$(cat "$DB_PATH")
maria_PASSWORD=$(cat "$USER_PATH")

service mariadb start

mysql <<EOF
CREATE USER '$maria_USER'@'%' IDENTIFIED BY '$maria_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$maria_USER'@'%' IDENTIFIED BY '$maria_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$maria_ROOT_PASSWORD';
FLUSH PRIVILEGES;
CREATE DATABASE $maria_DATABASE;
EOF

service mariadb stop

exec mysqld
