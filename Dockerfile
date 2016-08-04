FROM alpine
MAINTAINER hitalos <hitalos@gmail.com>

# Updating general packages
RUN apk update && apk upgrade

# Installing php and dependencies
RUN apk add \
    bash \
    git \
    nodejs \
    php5-ctype \
    php5-curl \
    php5-dom \
    php5-exif \
    php5-gd \
    php5-gettext \
    php5-iconv \
    php5-intl \
    php5-json \
    php5-ldap \
    php5-mcrypt \
    php5-openssl \
    php5-pdo_dblib \
    php5-pdo_mysql \
    php5-pdo_pgsql \
    php5-pdo_sqlite \
    php5-phar \
    php5-xml \
    php5-xmlreader \
    php5-xmlrpc \
    php5-zip \
    php5-zlib

# Setting memory_limit directive
RUN sed -i -e 's/memory_limit = 128M/memory_limit = 256M/' /etc/php5/php.ini

# Installing Composer
RUN php -r "readfile('https://getcomposer.org/installer');" | php &&\
    mv composer.phar /usr/bin/composer && chmod +x /usr/bin/composer

# Install dev packages
RUN apk add \
    autoconf \
    automake \
    cyrus-sasl-dev \
    g++ \
    gcc \
    libtool \
    make \
    musl-dev \
    openssl-dev \
    php5-dev \
    php5-pear \
    python

# Install MongoDB extension
RUN  php /usr/share/pear/peclcmd.php install mongo && \
    echo 'extension=mongo.so' > /etc/php5/conf.d/mongo.ini

WORKDIR /var/www
CMD php ./artisan serve --host=0.0.0.0 --port=80
EXPOSE 80
