#!/bin/bash

ymdhm=`date +%Y%m%d_%H%M`
docker exec -i qa-mysql mysql -u root --password='jb21UAu##qGtw75' -e"create database if not exists qa_$ymdhm DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci"
cat $1 | gunzip | docker exec -i qa-mysql /usr/bin/mysql -u root --password='jb21UAu##qGtw75' qa_$ymdhm


