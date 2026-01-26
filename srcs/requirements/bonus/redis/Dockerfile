FROM debian:12

RUN apt update && apt install -y redis-server \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/^bind .*/bind 0.0.0.0/' /etc/redis/redis.conf \
    && sed -i 's/^protected-mode yes/protected-mode no/' /etc/redis/redis.conf

CMD ["redis-server", "/etc/redis/redis.conf", "--daemonize", "no"]