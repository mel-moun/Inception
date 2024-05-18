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
fi

docker build -t nginx_t .
docker run -itd -p 443:443 nginx_t