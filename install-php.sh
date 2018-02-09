#!/bin/sh

# Install dependencies
apt-get install libcurl4-gnutls-dev libicu-dev libmcrypt-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libpq-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev -yqq
pecl install mcrypt-1.0.1
docker-php-ext-enable mcrypt

# Install php extensions
docker-php-ext-install mbstring pdo_mysql curl json intl gd xml zip bz2 opcache
