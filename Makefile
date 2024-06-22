COMPOSE_FILE := srcs/docker-compose.yml

all:
	docker compose -f $(COMPOSE_FILE) up -d

build:
	docker compose -f $(COMPOSE_FILE) build

stop:
	docker compose -f $(COMPOSE_FILE) down

re: stop all

clean:
	docker compose -f $(COMPOSE_FILE) down
	docker rm -f $(docker ps -aq)

fclean:
	docker compose -f $(COMPOSE_FILE) down
	docker system prune -a -f 
	docker volume prune -f
	rm -rf /home/mel-moun/data/v_mariadb/*
	rm -rf /home/mel-moun/data/v_wordpress/*
	
.PHONY: all build stop re clean fclean
