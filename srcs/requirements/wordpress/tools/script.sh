# # #!/bin/bash

# # DB_NAME="mery"
# # DB_USER="Meriem"
# # DB_PASSWORD="INCEPTION"
# # DB_HOST="172.17.0.2:3306"
# # WP_CONFIG_PATH="/var/www/wordpress/wp-config.php"

# # if [ -f "$WP_CONFIG_PATH" ]; then
# #     echo "The file wp-config.php already exists."
# # else
# # sleep 5
# #     wp config create --allow-root --dbname=$DB_NAME  --dbuser=$DB_USER  --dbpass=$DB_PASSWORD --dbhost=$DB_HOST  --path='/var/www/wordpress/'

# # fi

# # exec "$@"


#!/bin/bash


if [ -f "$WP_CONFIG_PATH" ]; then
    echo "The file wp-config.php already exists."
else
    sleep 5
    wp config create --allow-root --dbname=$DB_NAME  --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --path='/var/www/wordpress/'
    wp core install --url="localhost" --title="Inception" --admin_user="$DB_USER" \
	--admin_password="$DB_PASSWORD" --admin_email="meriemelmountasser3@gmail.com" --skip-email --allow-root
	wp user create $ADMIN_USER hia@gmail.com --role=author --user_pass=$ADMIN_PWD --allow-root
fi

exec "$@"

