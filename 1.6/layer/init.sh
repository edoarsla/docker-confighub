#!/usr/bin/env bash

if [ ! -z "${DB_USERNAME}" ] && [ ! -z "${DB_PASSWORD}" ]; then
    export DB_DRIVER=${DB_DRIVER:-com.mysql.jdbc.Driver}
    export DB_URL=${DB_URL:-jdbc:mysql://db:3306}

    echo "Writing database credentials to /confighub-v1.6/server/conf/tomee.xml"
    envsubst < /var/tpl/tomee.xml > /confighub-v1.6/server/conf/tomee.xml
fi

supervisord --nodaemon --configuration /etc/supervisord.conf
