FROM        java:8-alpine

RUN         apk update && apk add --no-cache \
                wget \
                bash \
                python \
                py-pip \
                gettext \
            && pip install supervisor \
            && mkdir /var/log/supervisord \
            && wget -q https://github.com/ConfigHubPub/ConfigHubPlatform/releases/download/v1.6/confighub-v1.6.tar.gz \
            && tar -xzvf confighub-v1.6.tar.gz \
            && rm confighub-v1.6.tar.gz \
            && rm /bin/sh && ln -s /bin/bash /bin/sh
            # Fixes a bug where /bin/sh on alpine can't do <<<.

COPY        ./layer /

EXPOSE      80 443
ENTRYPOINT ["/init.sh"]
