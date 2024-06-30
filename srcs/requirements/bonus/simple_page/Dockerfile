FROM debian:bookworm

RUN apt update -y && apt install -y nginx

COPY ./resume /var/www/html

EXPOSE 8081

CMD ["nginx", "-g", "daemon off;"]
