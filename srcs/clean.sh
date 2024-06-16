#!/bin/bash



if [ "$1" = 'clean' ]
then 
    docker rm -f $(docker ps -aq)
fi
if [ "$1" = 'fclean' ] 
then
    docker rm -f $(docker ps -aq)
    docker rmi -f $(docker images -aq)
    docker system prune -f
    docker system df
    rm -rf /home/mel-moun/data/*/*
    docker volume rm $(docker volume ls -q)

    # docker build -t mariadb_t ./requirements/mariadb/
    # docker build -t wordpress_t ./requirements/wordpress/
    # docker build -t nginx_t  ./requirements/nginx/
fi

# docker build -t nginx_t .
# docker run -itd -p 443:443 nginx_t