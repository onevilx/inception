#!/bin/sh
set -e

cat << EOF > /etc/nginx/conf.d/default.conf
server {
    listen 8090;
    root /var/www/html/tools;
    index index.html;
}
EOF

exec nginx -g "daemon off;"
