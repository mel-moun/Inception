FROM debian:bookworm

RUN apt update -y && apt install -y nginx

COPY ./resume /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
