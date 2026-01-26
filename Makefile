USER := $(shell whoami)

DATA_DIR := /home/$(USER)/data
WP_DIR   := $(DATA_DIR)/wordpress
DB_DIR   := $(DATA_DIR)/mariadb
PT_DIR	 := $(DATA_DIR)/portainer

COMPOSE := docker compose -f srcs/docker-compose.yml

all: up

up:
	mkdir -p $(WP_DIR)
	mkdir -p $(DB_DIR)
	mkdir -p $(PT_DIR)
	$(COMPOSE) up --build -d

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down
	rm -rf $(DATA_DIR)

re: clean
	make up

.PHONY: all up down clean re