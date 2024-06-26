#!/bin/bash

maria_PASSWORD=$(cat "$USER_PATH")
ADMIN_PWD=$(cat "$ADMIN_PATH")

if [ -f "$WP_CONFIG_PATH" ]; then
    echo "The file wp-config.php already exists."
else
    sleep 5
    wp config create --allow-root --dbname=$maria_DATABASE  --dbuser=$maria_USER --dbpass=$maria_PASSWORD --dbhost=$DB_HOST --path='/var/www/wordpress/'
    wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN_USER \
	--admin_password="$ADMIN_PWD" --admin_email=$ADMIN_EMAIL --skip-email --allow-root
	wp user create $maria_USER nonnon@gmail.com --role=author --user_pass=$maria_PASSWORD --allow-root
fi
    chown -R www-data:www-data /var/www/html
    chmod -R 0777 /var/www/

exec "$@"
