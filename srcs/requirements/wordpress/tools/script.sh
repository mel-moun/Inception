#!/bin/bash

DB_NAME="mery"
DB_USER="Meriem"
DB_PASSWORD="INCEPTION"
DB_HOST="172.17.0.2:3306"
WP_CONFIG_PATH="/var/www/wordpress/wp-config.php"

if [ -f "$WP_CONFIG_PATH" ]; then
    echo "The file wp-config.php already exists."
else
    wp config create --allow-root --dbname=$DB_NAME  --dbuser=$DB_USER  --dbpass=$DB_PASSWORD --dbhost=$DB_HOST  --path='/var/www/wordpress/'
fi

exec "$@"