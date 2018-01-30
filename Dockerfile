FROM php:alpine
LABEL maintainer="hitalos <hitalos@gmail.com>"

RUN apk update && apk upgrade && apk add bash git openssh

# Install PHP extensions
ADD install-php.sh /usr/sbin/install-php.sh
RUN /usr/sbin/install-php.sh

# Download and install NodeJS
ENV NODE_VERSION 8.9.4
ADD install-node.sh /usr/sbin/install-node.sh
RUN /usr/sbin/install-node.sh
RUN npm i -g yarn

RUN apk update && apk upgrade && apk add python2 && apk upgrade
