FROM debian:bookworm

RUN apt update && apt install -y wget php php-mysqli php-pdo php-cli

RUN mkdir -p /var/www/html

RUN wget https://www.adminer.org/latest.php -O /var/www/html/adminer.php

EXPOSE 8080

WORKDIR /var/www/html

RUN mv /var/www/html/adminer.php /var/www/html/index.php

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
