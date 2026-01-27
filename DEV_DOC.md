# DEV_DOC.md — Developer Documentation

## 1. Purpose

This document explains how a developer can set up, build, run, and maintain the project.
It focuses on the technical setup, Docker usage, and data persistence.

---

## 2. Prerequisites

The following tools must be installed on the host system:

- Docker
- Docker Compose
- GNU Make
- OpenSSL (for SSL certificates)
- A Unix-based system (Linux or macOS)

Check installation:
```bash
docker --version
docker compose version
make --version
```

---

## 3. Project Structure
```bash
inception/
├── Makefile
├── README.md
├── USER_DOC.md
├── DEV_DOC.md
└── srcs/
    ├── docker-compose.yml
    ├── .env
    └── requirements/
        ├── mariadb/
        │   ├── Dockerfile
        │   └── tools/
        ├── nginx/
        │   ├── Dockerfile
        │   └── conf/
        ├── wordpress/
        │   ├── Dockerfile
        │   └── tools/
        └── bonus/
            ├── redis/
            ├── adminer/
            ├── ftp/
            ├── website/
            └── portainer/
```
**Each service has:**

- Its own Dockerfile

- Initialization scripts

- Isolated configuration

---

## 4. Environment Configuration
1. .env File

The .env file contains all environment variables required by the services, in my project i used .env not secrets as you can see in the directory.

Examples:
```bash
MYSQL_DATABASE=...
MYSQL_USER=...
MYSQL_PASSWORD=...
...
```

---

## 5. Build and Launch Process

1. Using Makefile Build and start the stack by:
```bash
make
```
2. Stop the stack by:
```bash
make down
```
3. Rebuild everything by:
```bash
make re
```
4. Clean containers, images, and volumes by:
```bash
make clean
```

---

## 6. Container and Volume Management

1. List running containers
```bash
docker compose ps
```
2. View logs
```bash
docker compose logs <name_service>
```
3. Access a container shell
```bash
docker exec -it <container_name> sh
```

---

## 7. Volumes and Data Persistence

**Persistent data is stored using Docker volumes.**
#### Main volumes:
- MariaDB data → /var/lib/mysql
- WordPress files → /var/www/html

#### Volumes allow:
- Data persistence after container restarts
- Separation of data from container lifecycle

#### List volumes:
```bash
docker volume ls
```
#### Inspect volume:
```bash
docker volume inspect <volume_name>
```

---

## 8. Networking
**All services run on a custom Docker bridge network,**
**Services communicate using container names as hostnames,**
**No service depends on the host network.**

#### Example:
```bash
wordpress → mariadb
wordpress → redis
nginx → wordpress
```

---

## 9. Service Initialization Flow
```bash
1. MariaDB initializes database and users

2. WordPress waits for MariaDB

3. WordPress installs core and users via WP-CLI

4. Redis is enabled via WordPress plugin (bonus part)

5. Nginx serves WordPress over HTTPS
```

---