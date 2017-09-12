FROM        java:8-alpine

ENV         VERSION="v1.6.2"

RUN         apk update && apk add --no-cache \
                wget \
                bash \
                python \
                py-pip \
                gettext \
            && pip install supervisor \
            && mkdir /var/log/supervisord

COPY        /Users/edin/staging/server.tar.gz .
COPY        /Users/edin/ConfigHub/rest/target/ROOT.war .

            # && wget -q https://github.com/ConfigHubPub/ConfigHubPlatform/releases/download/${VERSION}/confighub-${VERSION}.tar.gz \
RUN         tar -xzvf server.tar.gz \
            && rm server.tar.gz \
            && mv server confighub \
            && mv ROOT.war confighub/server/webapps \
            && rm /bin/sh && ln -s /bin/bash /bin/sh
            # Fixes a bug where /bin/sh on alpine can't do <<<.

COPY        ./layer /

EXPOSE      80 443
ENTRYPOINT ["/init.sh"]
