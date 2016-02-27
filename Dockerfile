FROM alpine
MAINTAINER hitalos <hitalos@gmail.com>

RUN apk update && apk upgrade
RUN apk add bash

RUN apk add php-ctype php-curl php-dom php-gd php-gettext php-iconv php-intl \
    php-json php-ldap php-mcrypt php-mssql php-openssl php-pdo_dblib \
    php-pdo_mysql php-pdo_pgsql php-pdo_sqlite php-pgsql php-phar php-xml \
    php-xmlreader php-xmlrpc php-zip

RUN sed -i -e 's/memory_limit = 128M/memory_limit = 256M/' /etc/php/php.ini

WORKDIR /var/www
CMD php ./artisan serve --host=0.0.0.0 --port=80
EXPOSE 80
