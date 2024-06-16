#!/bin/sh

# maria_USER='Meriem'
# maria_PASSWORD='INCEPTION'
# maria_ROOT_PASSWORD='Bullshit'
# MARIADB_DATABASE='mery'

# until mysqladmin ping -h localhost --silent; do
#   sleep 1
# done

# mariadbd <<EOF
# FLUSH PRIVILEGES;
# CREATE DATABASE $MARIADB_DATABASE;

# CREATE USER IF NOT EXISTS '${maria_USER}'@'%' IDENTIFIED BY '${maria_PASSWORD}';
# GRANT ALL PRIVILEGES ON *.* TO '$maria_USER'@'%' IDENTIFIED BY '$maria_PASSWORD';
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$maria_ROOT_PASSWORD';
# FLUSH PRIVILEGES;
# EOF

service mariadb start;


mysql -e "CREATE DATABASE IF NOT EXISTS \`$MARIADB_DATABASE\`;"


mysql -e "CREATE USER IF NOT EXISTS \`$maria_USER\`@'%' IDENTIFIED BY '$maria_PASSWORD';"


mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$maria_USER'@'%' IDENTIFIED BY '$maria_PASSWORD';"


mysql -e "FLUSH PRIVILEGES;"

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

# exec mariadbd

