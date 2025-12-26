FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y php8.2-fpm php8.2-mysql php8.2-cli php8.2-curl php8.2-gd php8.2-mbstring php8.2-xml php8.2-zip wget unzip

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz && tar -xzf latest.tar.gz --strip-components=1 && rm latest.tar.gz

RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000

CMD ["php-fpm8.2", "-F"]