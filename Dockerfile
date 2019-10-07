FROM php:7.2-apache

RUN set -xe && \
    apt-get update && \
    apt-get install -y \
        libfreetype6-dev \
        libjpeg-dev \
        libpng-dev \
        libcurl4-openssl-dev \
        libzip-dev \
        libicu-dev \
        libldap-dev \
        imagemagick \
        unzip && \
    docker-php-ext-install -j$(nproc) \
        curl \
        mbstring \
        pdo_mysql \
        zip \
        exif \
        intl \
        fileinfo \
        ldap && \
    docker-php-ext-configure \
        gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) \
        gd && \
    printf "\n" | pecl install APCu && \
    docker-php-ext-enable apcu.so