#!/bin/sh
set -e

mkdir -p /var/www/html

cp /adminer.php /var/www/html/adminer.php
chown -R www-data:www-data /var/www/html

exec php -S 0.0.0.0:5050 -t /var/www/html
