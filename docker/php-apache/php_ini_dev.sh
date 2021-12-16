#!/bin/bash

# set php.ini settings
sed -i 's/short_open_tag = .*/short_open_tag = On/g' "$PHP_INI_DIR/php.ini"
sed -i 's/expose_php = .*/expose_php = Off/g' "$PHP_INI_DIR/php.ini"
sed -i 's/max_execution_time = .*/max_execution_time = 120/g' "$PHP_INI_DIR/php.ini"
sed -i 's/max_input_time = .*/max_input_time = 120/g' "$PHP_INI_DIR/php.ini"
sed -i 's/memory_limit = .*/memory_limit = 256M/g' "$PHP_INI_DIR/php.ini"
sed -i 's/post_max_size = .*/post_max_size = 150M/g' "$PHP_INI_DIR/php.ini"
sed -i 's/display_errors = .*/display_errors = Off/g' "$PHP_INI_DIR/php.ini"
sed -i 's/upload_max_filesize = .*/upload_max_filesize = 150M/g' "$PHP_INI_DIR/php.ini"
sed -i 's/max_file_uploads = .*/max_file_uploads = 20/g' "$PHP_INI_DIR/php.ini"
sed -i 's/session.gc_maxlifetime = .*/session.gc_maxlifetime = 4320/g' "$PHP_INI_DIR/php.ini"
sed -i 's/display_errors = .*/display_errors = OFF/g' "$PHP_INI_DIR/php.ini"