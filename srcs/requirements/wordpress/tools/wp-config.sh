#!/bin/bash
set -e

WP_PATH="/var/www/html"

until mysqladmin ping -h "$WP_DB_HOST" --silent; do
    sleep 5
done

if [ ! -f "$WP_PATH/wp-config.php" ]; then
    echo "Setting up WordPress..."

    wp config create \
        --dbname="$WP_DB_NAME" \
        --dbuser="$WP_DB_USER" \
        --dbpass="$WP_DB_PASSWORD" \
        --dbhost="$WP_DB_HOST" \
        --path="$WP_PATH" \
        --allow-root

    wp core install \
        --url="https://yaboukir.42.fr" \
        --title="Inception" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email \
        --allow-root

    wp user create \
        "$WP_USER" "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --role=author \
        --path="$WP_PATH" \
        --allow-root
    
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_DATABASE 0 --raw --allow-root
    wp config set WP_REDIS_TIMEOUT 1 --raw --allow-root
    wp config set WP_REDIS_READ_TIMEOUT 1 --raw --allow-root
    wp plugin install redis-cache --activate --allow-root
    wp redis enable --allow-root
fi

exec php-fpm8.2 -F
