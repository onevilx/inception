FROM debian:12

RUN apt-get update && apt-get install -y \
    php8.2-fpm php8.2-mysql php8.2-cli \
    mariadb-client wget curl php-redis \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xzf latest.tar.gz --strip-components=1 \
    && rm latest.tar.gz

COPY tools/wp-config.sh /usr/local/bin/init.sh

RUN chmod +x /usr/local/bin/init.sh

RUN chown -R www-data:www-data /var/www/html

RUN sed -i 's|listen = .*|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["/usr/local/bin/init.sh"]