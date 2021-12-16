#!/bin/bash

set -e

role=${CONTAINER_ROLE:-app}
env=${APP_ENV:-production}

# if [ "$env" != "local" ]; then
#     echo "Caching configuration..."
#     php artisan optimize
# fi

if [ "$role" = "app" ]; then
    exec apache2-foreground
elif [ "$role" = "supervisor" ]; then
    exec supervisord --nodaemon
else
    echo "Could not match the container role \"$role\""
    exit 1
fi
