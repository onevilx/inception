FROM debian:12

RUN apt update && apt install -y nginx \
    && rm -rf /var/lib/apt/lists/*

COPY tools/index.html /var/www/html/index.html
COPY tools/wb_init.sh /wb_init.sh

RUN chmod +x /wb_init.sh

EXPOSE 8090

CMD ["/wb_init.sh"]
