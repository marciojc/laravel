FROM alpine
MAINTAINER hitalos <hitalos@gmail.com>

# Updating general packages
RUN apk update && apk upgrade

# Installing php and dependencies
RUN apk add \
    bash \
    git \
    nodejs \
    php-ctype \
    php-curl \
    php-dom \
    php-exif \
    php-gd \
    php-gettext \
    php-iconv \
    php-intl \
    php-json \
    php-ldap \
    php-mcrypt \
    php-openssl \
    php-pdo_dblib \
    php-pdo_mysql \
    php-pdo_pgsql \
    php-pdo_sqlite \
    php-phar \
    php-xml \
    php-xmlreader \
    php-xmlrpc \
    php-zip \
    php-zlib

# Setting memory_limit directive
RUN sed -i -e 's/memory_limit = 128M/memory_limit = 256M/' /etc/php/php.ini

# Installing Composer
RUN php -r "readfile('https://getcomposer.org/installer');" | php &&\
    mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer

# Install dev packages
RUN apk add \
    autoconf \
    automake \
    cyrus-sasl-dev \
    gcc \
    libtool \
    make \
    musl-dev \
    openssl-dev \
    php-dev \
    php-pear

# Install MongoDB extension
RUN  php /usr/share/pear/peclcmd.php install mongo && \
    echo 'extension=mongo.so' > /etc/php/conf.d/mongo.ini

WORKDIR /var/www
CMD php ./artisan serve --host=0.0.0.0 --port=80
EXPOSE 80
