FROM debian:bookworm

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get -y install wget \
    php8.2 \
    php-fpm \
	php-mysql \
    mariadb-client

RUN wget https://wordpress.org/latest.tar.gz -P /var/www \
    && cd /var/www \
    && tar -xzf latest.tar.gz \
    && rm latest.tar.gz \
    && chown -R www-data:www-data /var/www/wordpress

RUN sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/8.2/fpm/pool.d/www.conf

WORKDIR /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY ./tools/script.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/script.sh

CMD ["/usr/sbin/php-fpm8.2", "-F"]

ENTRYPOINT ["sh", "/usr/local/bin/script.sh"]
