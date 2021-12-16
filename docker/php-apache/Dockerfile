FROM php:8.0-apache

USER root

WORKDIR /var/www/html

RUN mv /etc/localtime /etc/localtime.bak && ln -s /usr/share/zoneinfo/Asia/Baku /etc/localtime

RUN apt-get update && apt-get install -y \
        libpng-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        zip \
        curl \
        unzip \
        supervisor \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install opcache \
    && docker-php-ext-install pcntl \
    && docker-php-source delete

RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

COPY --chown=www-data:www-data . /var/www/html

COPY docker/php-apache/conf /etc/apache2/sites-available

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY docker/php-apache/php_ini.sh ./php_ini.sh
RUN chmod u+x ./php_ini.sh && ./php_ini.sh && rm ./php_ini.sh

RUN a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get install npm -y



COPY docker/php-apache/supervisord.conf /etc/supervisor/conf.d/

COPY docker/php-apache/update-me.sh /usr/local/bin/update-me
RUN chmod u+x /usr/local/bin/update-me

COPY docker/php-apache/start-me.sh /usr/local/bin/start-me
RUN chmod u+x /usr/local/bin/start-me

RUN chmod u+x /usr/local/bin/start-me
CMD /usr/local/bin/update-me && /usr/local/bin/start-me
