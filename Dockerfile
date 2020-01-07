FROM php:7.2-apache

RUN set -xe && \
    apt-get update && \
    apt-get install -y \
        libfreetype6-dev \
        libjpeg-dev \
        libpng-dev \
        libcurl4-openssl-dev \
        libzip-dev \
        libbz2-dev \
        libicu-dev \
        libldap-dev \
        imagemagick \
        git \
        unzip && \
    docker-php-ext-install -j$(nproc) \
        curl \
        mbstring \
        pdo_mysql \
        zip \
        bz2 \
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

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

## clone humhub
#RUN git clone https://github.com/Coinsence/humhub
#

COPY docker-coinsence-entrypoint.sh /docker-coinsence-entrypoint.sh

RUN chmod +x /docker-coinsence-entrypoint.sh

CMD /docker-coinsence-entrypoint.sh
