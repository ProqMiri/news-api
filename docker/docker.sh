#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR
cd ..

docker-compose -f docker/docker-compose-local.yml up -d news-app-mysql
sleep 10
docker-compose -f docker/docker-compose-local.yml up -d news-app1
sleep 10
docker-compose -f docker/docker-compose-local.yml up -d news-app-supervisor
