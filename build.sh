#!/usr/bin/env bash
set -e
set -x
[ -z "$APP_HOME" ] && export APP_HOME=$(pwd)
[ -z "$UMAMI_VERSION" ] && export UMAMI_VERSION="2.2.0"
[ -z "$PORT" ] && export PORT="8080"

rm -rf umami-$UMAMI_VERSION
rm -rf v$UMAMI_VERSION.tar.gz
wget https://github.com/umami-software/umami/archive/refs/tags/v$UMAMI_VERSION.tar.gz

tar xvzf v$UMAMI_VERSION.tar.gz
cd "umami-$UMAMI_VERSION"

npm install yarn
./node_modules/.bin/yarn install

if [[ -z "${POSTGRESQL_ADDON_URI}" ]]; then
    echo "POSTGRESQL_ADDON_URI is not set"
    exit 1 
else
    echo ${POSTGRESQL_ADDON_URI} >> .env
fi

./node_modules/.bin/yarn build

