FROM php:alpine
LABEL maintainer="marciojcc <marcio@gen.pt>"

RUN apk update && apk upgrade && apk add bash git openssh ca-certificates

# Install PHP extensions
ADD install-php.sh /usr/sbin/install-php.sh
RUN /usr/sbin/install-php.sh

# Download and install NodeJS
ENV NODE_VERSION 8.9.4
ADD install-node.sh /usr/sbin/install-node.sh
RUN /usr/sbin/install-node.sh

# Install node sass
# ENV NODESASS_VERSION 4.0.0
# ADD install-node-sass.sh /usr/sbin/install-node-sass.sh
# RUN /usr/sbin/install-node-sass.sh

# Install Yarn
RUN npm i -g yarn
