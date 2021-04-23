FROM php:7.4-apache

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN apt-get update && apt-get install --no-install-recommends -yq ${BUILD_PACKAGES} \
        build-essential \
        vim \
        git \
        wget \
        unzip \
        libmcrypt-dev \
        libicu-dev \
        libzip-dev \
        curl \
    && apt-get clean

ENV PHP_EXTENSIONS opcache pdo_mysql pcntl intl zip
RUN docker-php-ext-install ${PHP_EXTENSIONS}

ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin

WORKDIR /var/www/