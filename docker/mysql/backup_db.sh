#!/bin/bash

domain_name="qa.qscepter.com"
folder_name="/qa"

ym=`date +%Y%m`
ymdhm=`date +%Y%m%d_%H%M`
mkdir -p $folder_name/mysql_backup/$ym
docker exec qa-mysql /usr/bin/mysqldump -u root --password='jb21UAu##qGtw75' --skip-add-locks qa | gzip > $folder_name/mysql_backup/$ym/backup_$ymdhm.sql.gz

