#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR

rm -Rf mysql/conf/mysql.cnf && cp mysql/conf/mysql_dev.cnf mysql/conf/mysql.cnf
rm -Rf php-apache/php_ini.sh && cp php-apache/php_ini_dev.sh php-apache/php_ini.sh
rm -Rf php-apache/opcache.ini && cp php-apache/opcache_dev.ini php-apache/opcache.ini
rm -Rf php-apache/supervisord.conf && cp php-apache/supervisord_dev.conf php-apache/supervisord.conf
rm -Rf .env && cp .env.example .env
rm -Rf docker-compose-local.yml && cp docker-compose.yml docker-compose-local.yml
