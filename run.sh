#!/usr/bin/env bash
set -e
set -x
[ -z "$APP_HOME" ] && export APP_HOME=$(pwd)
[ -z "$UMAMI_VERSION" ] && export UMAMI_VERSION="2.0.0"
[ -z "$PORT" ] && export PORT="8080"

cd umami-$UMAMI_VERSION

if [[ -z "${POSTGRESQL_ADDON_URI}" ]]; then
    echo "POSTGRESQL_ADDON_URI is not set"
    exit(1) 
else
    echo ${POSTGRESQL_ADDON_URI} >> .env
fi

./node_modules/.bin/yarn start