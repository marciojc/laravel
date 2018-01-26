FROM php:alpine
LABEL maintainer="marciojcc <marcio@gen.pt>"

RUN apk update && apk upgrade && apk add bash git openssh

# Install PHP extensions
ADD install-php.sh /usr/sbin/install-php.sh
RUN /usr/sbin/install-php.sh

# Download and install NodeJS
ENV NODE_VERSION 8.9.4
ADD install-node.sh /usr/sbin/install-node.sh
RUN /usr/sbin/install-node.sh
RUN apk add yarn
