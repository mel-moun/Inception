#!/bin/sh

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
