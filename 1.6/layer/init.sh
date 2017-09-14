#!/usr/bin/env bash

if [ -z ${DB_MAIN_DRIVER+x} ]; then echo "DB_MAIN_DRIVER not set!" exit 1; fi
if [ -z ${DB_MAIN_URL+x} ]; then echo "DB_MAIN_URL not set!" exit 1; fi
if [ -z ${DB_MAIN_USERNAME+x} ]; then echo "DB_MAIN_USERNAME not set!" exit 1; fi
if [ -z ${DB_MAIN_PASSWORD+x} ]; then echo "DB_MAIN_PASSWORD not set!" exit 1; fi

if [ -z ${DB_API_DRIVER+x} ]; then echo "DB_API_DRIVER not set!" exit 1; fi
if [ -z ${DB_API_URL+x} ]; then echo "DB_API_URL not set!" exit 1; fi
if [ -z ${DB_API_USERNAME+x} ]; then echo "DB_API_USERNAME not set!" exit 1; fi
if [ -z ${DB_API_PASSWORD+x} ]; then echo "DB_API_PASSWORD not set!" exit 1; fi

echo "Writing database credentials to /confighub/server/conf/tomee.xml"
envsubst < /var/tpl/tomee.xml > /confighub/server/conf/tomee.xml

export ALLOCATED_MEMORY=${ALLOCATED_MEMORY:-4g}
export HTTP_PORT=${HTTP_PORT:-80}
export HTTPS_PORT=${HTTPS_PORT:-443}
export LOG_PATH=${LOG_PATH:-/var/log/confighub}
export KEYSTORE_FILE=${KEYSTORE_FILE:-cert/confighub_default.jks}
export KEYSTORE_ALIAS=${KEYSTORE_ALIAS:-confighub}
export KEYSTORE_PASSWORD=${KEYSTORE_PASSWORD:-confighub}

echo "Writing server configuration to confighub/confighub.sh"
envsubst < /var/tpl/confighub.sh > /confighub/confighub.sh

#supervisord --nodaemon --configuration /etc/supervisord.conf

# Start the service
source /confighub/server/bin/startup.sh