#!/usr/bin/env bash

#if [ ! -z "${DB_USERNAME}" ] && [ ! -z "${DB_PASSWORD}" ]; then
export DB_DRIVER=${DB_DRIVER:-com.mysql.jdbc.Driver}
export DB_URL=${DB_URL:-jdbc:mysql://192.168.1.115:3306}

echo "Writing database credentials to /confighub/server/conf/tomee.xml"
envsubst < /var/tpl/tomee.xml > /confighub/server/conf/tomee.xml
#fi

export ALLOCATED_MEMORY=${ALLOCATED_MEMORY:-4g}
export HTTP_PORT=${HTTP_PORT:-80}
export HTTPS_PORT=${HTTPS_PORT:-443}
export LOG_PATH=${LOG_PATH:-/var/log/confighub}
export KEYSTORE_FILE=${KEYSTORE_FILE:-cert/confighub_default.jks}
export KEYSTORE_ALIAS=${KEYSTORE_ALIAS:-confighub}
export KEYSTORE_PASSWORD=${KEYSTORE_PASSWORD:-confighub}

echo "Writing database credentials to /confighub/server/conf/tomee.xml"
envsubst < /var/tpl/confighub.sh > /confighub/confighub.sh

supervisord --nodaemon --configuration /etc/supervisord.conf
