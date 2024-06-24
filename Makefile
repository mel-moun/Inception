COMPOSE_FILE := srcs/docker-compose.yml
SECRETS_DIR := secrets

all: $(SECRETS_DIR) generate_passwords
	@docker compose -f $(COMPOSE_FILE) up -d

build: $(SECRETS_DIR) generate_passwords
	@docker compose -f $(COMPOSE_FILE) build

stop:
	@docker compose -f $(COMPOSE_FILE) stop

clean:
	@docker compose -f $(COMPOSE_FILE) down

fclean: clean
	@rm -rf $(SECRETS_DIR)
	@docker system prune -a -f 
	@docker volume prune -f
	@sudo rm -rf /home/mel-moun/data/mariadb_volume/*
	@sudo rm -rf /home/mel-moun/data/wordpress_volume/*

re: fclean all

generate_passwords: $(SECRETS_DIR)/db_password.txt $(SECRETS_DIR)/admin_password.txt $(SECRETS_DIR)/user_password.txt

$(SECRETS_DIR):
	@mkdir -p $(SECRETS_DIR)

$(SECRETS_DIR)/db_password.txt:
	@openssl rand -base64 20 > $(SECRETS_DIR)/db_password.txt

$(SECRETS_DIR)/admin_password.txt:
	@openssl rand -base64 20 > $(SECRETS_DIR)/admin_password.txt

$(SECRETS_DIR)/user_password.txt:
	@openssl rand -base64 20 > $(SECRETS_DIR)/user_password.txt

.PHONY: all build stop re clean fclean generate_passwords
