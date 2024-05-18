FROM debian:bookworm

WORKDIR /etc/nginx/ssl

RUN apt-get update \
    && apt-get install -y nginx \
    openssl

RUN openssl genrsa -out /etc/nginx/ssl/mery.key 2048 \
    && openssl req -x509 -key /etc/nginx/ssl/mery.key -out /etc/nginx/ssl/mery.crt -days 356 -subj "/C=MA/L=Tetouan/O=1337MED/UID=mery"

COPY conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
