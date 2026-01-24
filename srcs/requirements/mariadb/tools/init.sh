#!/bin/sh

set -e

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -f '/etc/.firstrun' ]; then
	echo 'first time setup...'
	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql > /dev/null
	TMP=/tmp/.tmpfile
	echo "FLUSH PRIVILEGES;" >> ${TMP}
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" >> ${TMP}
	echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" >> ${TMP}
	echo "CREATE USER IF NOT EXISTS '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';" >> ${TMP}
	echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';" >> ${TMP}
	echo "FLUSH PRIVILEGES;" >> ${TMP}
	/usr/sbin/mysqld --user=mysql --bootstrap < ${TMP}
	rm -f ${TMP}
	touch '/etc/.firstrun'
fi

exec /usr/sbin/mysqld --user=mysql --console