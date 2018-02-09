#!/bin/sh
curl -sL https://deb.nodesource.com/setup_7.x | bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

# Remove ubuntu's default yarn and install the nodejs yarn
apt-get remove cmdtest && apt remove yarn

# Install dependencies
curl -sS https://getcomposer.org/installer | php
apt-get install git nodejs -yqq
npm install -g yarn
