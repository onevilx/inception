# USER_DOC.md — User Documentation

## 1. Overview

This project provides a complete web infrastructure using Docker.  
The stack includes the following services:

- **Nginx** – Web server with HTTPS (SSL)
- **WordPress** – Content management system
- **MariaDB** – Database for WordPress
- **Redis** – Cache system to improve WordPress performance
- **Adminer** – Web-based database administration tool
- **Portainer** – Docker container management interface

All services run in isolated Docker containers and communicate through a Docker network.

---

## 2. Starting and Stopping the Project

### Start the project
From the project root directory:
```bash
make
```
### Stop the project
From the project root directory:
```bash
make down
```
### Stop and remove volumes (reset data)
From the project root directory:
```bash
make clean
```

---

## 3. Accessing the Services

1. if you want to access Website (WordPress) Type in URL:
```bash
WordPress: https://yaboukir.42.fr
```
OR want to access WordPress admin panel:
```bash
WordPress Admin: https://yaboukir.42.fr/wp-admin
```
**A browser warning may appear because a self-signed SSL certificate is used.**

2. if you want to access Adminer (Database Management) Type in URL:
```bash
Adminer: http://localhost:6699/adminer.php
```
- Login information:
```bash
    System: MySQL / MariaDB
    Server: mariadb
    Username: value from .env
    Password: value from .env
    Database: value from .env
```

3. if you want to access Portainer (Docker Management) Type in URL:
```bash
Portainer: https://localhost:1122
```
**Used to monitor containers, networks, volumes, and logs.**

4. Credentials Management:
```bash
All sensitive credentials are stored in the .env file located at the project root.

This file includes:

Database name

Database user and password

WordPress admin credentials

WordPress database credentials

⚠️ The .env file should never be shared or committed publicly.
```

5. Checking Service Status:

- List running containers:
```bash
docker compose ps or docker ps
```
- View logs of a specific service:
```bash 
docker compose logs <service_name>
```
- If data issues occur:
```bash
make re
```
