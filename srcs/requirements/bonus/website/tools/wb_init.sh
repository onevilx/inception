#!/bin/sh
set -e

cat << EOF > /etc/nginx/conf.d/default.conf
server {
    listen 8080;
    root /var/www/html/tools;
    index index.html;
}
EOF

exec nginx -g "daemon off;"
