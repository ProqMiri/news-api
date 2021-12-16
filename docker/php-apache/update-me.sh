#!/bin/bash

set -e

role=${CONTAINER_ROLE:-app}
env=${APP_ENV:-production}

php -d memory_limit=-1 /usr/local/bin/composer update
php artisan key:generate
php artisan optimize:clear
php artisan migrate --force
php artisan passport:install
if [ "$env" != "local" ]; then
    php artisan optimize
fi
