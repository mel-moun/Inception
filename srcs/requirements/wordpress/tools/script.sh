#!/bin/bash

if [ -f "$WP_CONFIG_PATH" ]; then
    echo "The file wp-config.php already exists."
else
    sleep 5
    wp config create --allow-root --dbname=$maria_DATABASE  --dbuser=$maria_USER --dbpass=$maria_PASSWORD --dbhost=$DB_HOST --path='/var/www/wordpress/'
    wp core install --url="localhost" --title="mel-moun" --admin_user="$ADMIN_USER" \
	--admin_password="$ADMIN_PWD" --admin_email="ouioui@gmail.com" --skip-email --allow-root
	wp user create $maria_USER nonnon@gmail.com --role=author --user_pass=$maria_PASSWORD --allow-root
fi
    chown -R www-data:www-data /var/www/html

exec "$@"
