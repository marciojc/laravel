#!/bin/sh
#
# Build script for node-sass
#
# Can take an optional parameter indicating the branch branch or tag to build
#

apk add --no-cache curl git build-base perl make gcc g++ python2 linux-headers paxctl libgcc libstdc++ gnupg ca-certificates
apk update

BRANCH="master"
if [ "$1" != "" ]; then
  BRANCH="$1"
fi

echo "Building branch $BRANCH"
mkdir -p "/build/$BRANCH"

# Download trusted certs
mkdir -p /etc/ssl/certs && update-ca-certificates

# install libsass
mkdir -p /etc/ssl/certs && update-ca-certificates
git clone https://github.com/sass/sassc && cd sassc && \
    git clone https://github.com/sass/libsass && \
    SASS_LIBSASS_PATH=/sassc/libsass make && \
    mv bin/sassc /usr/bin/sassc && \
    cd ../ && rm -rf /sassc

# created node-sass binary
SASS_BINARY_PATH=/usr/lib/node_modules/node-sass/build/Release/binding.node
git clone --recursive https://github.com/sass/node-sass.git && \
    cd node-sass && \
    git submodule update --init --recursive && \
    npm install && \
    node scripts/build -f && \
    cd ../ && rm -rf node-sass

# cd /tmp || exit 1
# curl -o node-sass-v${NODESASS_VERSION}.tar.gz -sSL https://github.com/sass/node-sass/archive/v${NODESASS_VERSION}.tar.gz
# tar -xvzf node-sass-v${NODESASS_VERSION}.tar.gz
# cd node-sass-${NODESASS_VERSION} || exit 1

# npm install
# node scripts/build -f

# cd vendor
# for file in $(find . -type f); do
#   DEST=$(echo "$file" | awk 'BEGIN { FS = "/" } ; {print $2"_"$3}')
#   cp $file "/build/$BRANCH/$DEST"
# done

apk del get
