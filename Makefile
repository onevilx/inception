USER := $(shell whoami)

DATA_DIR := /home/$(USER)/data
WP_DIR   := $(DATA_DIR)/wordpress
DB_DIR   := $(DATA_DIR)/mariadb

COMPOSE := docker compose -f srcs/docker-compose.yml

all: up

up:
	mkdir -p $(WP_DIR)
	mkdir -p $(DB_DIR)
	$(COMPOSE) up --build -d

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down -v
	rm -rf $(DATA_DIR)

re: clean
	make up

.PHONY: all up down clean re
