***This project has been created as part of the 42 curriculum by yaboukir.***

# Inception

## Description

**Inception** is a system administration and DevOps project from the 42 curriculum.  
The goal is to build a **complete web infrastructure using Docker** by setting up and connecting multiple services inside isolated containers.

This project uses **Docker and Docker Compose** to deploy a secure and modular
WordPress website running with:
- Nginx (HTTPS)
- WordPress + PHP-FPM
- MariaDB
- Redis (object cache)
- Adminer (database management)
- Portainer (Docker container management)

Each service runs in its own container and communicates through Docker networks,respecting best practices for security, isolation, and maintainability.

---

## Architecture Overview

Services included in this project:

- **Nginx**  
  Acts as a reverse proxy and HTTPS web server.

- **WordPress (PHP-FPM)**  
  Handles application logic and content management.

- **MariaDB**  
  Stores WordPress data.

- **Redis**  
  Used as an object cache to improve WordPress performance.

- **Adminer**  
  Lightweight web-based database management tool.

- **Portainer**  
  Web UI to manage Docker containers, images, volumes, and networks.

---

## Instructions

### Requirements

- Docker
- Docker Compose
- Linux environment

### Installation & Execution

1. Clone the repository:
```bash
git clone from the vogsphere
cd inception
```
2. Create a .env file (in this case i already have my own .env):
```bash
cp .env.example .env
```
3. Edit .env with your credentials:
```bash
MYSQL_DATABASE=..
MYSQL_ROOT_PASSWORD=...
WP_DB_USER=...
...
```
4. Add your domain to /etc/hosts:
```bash
127.0.0.1 yaboukir.42.fr
```
5. Build and run the containers:
```bash
make in the directory of inception
```
6. Access services:
```bash
WordPress: https://yaboukir.42.fr
Portainer: https://localhost:1122
Adminer: http://localhost:6699/adminer.php
Website: http://localhost:8084
...
```

---

## Resources

### Documentation & References

- **Docker**: https://docs.docker.com && https://www.geeksforgeeks.org/devops/introduction-to-docker/
- **Docker Compose**: https://www.geeksforgeeks.org/devops/docker-compose/
- **WordPress**: https://www.geeksforgeeks.org/wordpress/what-is-wordpress/
- **Nginx and php-fpm**: https://medium.com/@mgonzalezbaile/demystifying-nginx-and-php-fpm-for-php-developers-bba548dd38f9
- **MariaDB**: https://www.purestorage.com/nl/knowledge/what-is-mariadb.html
- **Redis**: https://www.geeksforgeeks.org/system-design/redis-cache/
- **Adminer**: https://medium.com/tools-trips/adminer-the-ultimate-lightweight-database-studio-you-need-to-try-free-e776d2744a11
- **Portainer**: https://www.portainer.io/whitepapers/what-is-portainer

### AI usage

AI was used as a learning and assistance tool to:

Understand Docker and Docker Compose concepts

Debug Dockerfiles and Compose configurations

Improve shell scripts and container communication

Clarify networking, volumes, and service interactions

All implementation decisions and final code were reviewed and adapted manually by me and with my peers.

Also write and structure this README !

---

## Project Description

**Why Docker?**

Docker allows running services in isolated, reproducible environments.
Each container has a single responsibility, making the system modular and easier to debug.

### Virtual Machines vs Docker

| Virtual Machines    | Docker                  |
| ------------------- | ----------------------- |
| Heavy (full OS)     | Lightweight             |
| Slower startup      | Fast startup            |
| High resource usage | Low resource usage      |
| Strong isolation    | Process-level isolation |

**Docker was chosen for performance, simplicity, and modern DevOps practices.**

### Secrets vs Environment Variables

| Secrets          | Environment Variables |
| ---------------- | --------------------- |
| Encrypted        | Plain text            |
| More secure      | Easier to use         |
| Docker Swarm/K8s | Docker Compose        |

**Environment variables are used in this project as required by the subject,while secrets are avoided for simplicity.**

### Docker Network vs Host Network

| Docker Network          | Host Network   |
| ----------------------- | -------------- |
| Isolated containers     | No isolation   |
| Safer                   | Risky          |
| Service name resolution | Port conflicts |

**Docker networks are used to allow containers to communicate securely by name.**

### Docker Volumes vs Bind Mounts

| Docker Volumes    | Bind Mounts     |
| ----------------- | --------------- |
| Managed by Docker | Managed by host |
| Portable          | Host-dependent  |
| Safer             | Less safe       |

**Volumes are used to persist database and WordPress data.**

---