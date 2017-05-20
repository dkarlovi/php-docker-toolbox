FROM composer:latest

ENV PATH="/toolbox/vendor/bin:${PATH}"
COPY vendor /toolbox/vendor
COPY sys/docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
WORKDIR /app
