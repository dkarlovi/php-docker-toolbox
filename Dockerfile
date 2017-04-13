FROM composer:latest

COPY docker-entrypoint.sh /docker-entrypoint.sh

COPY vendor /app/vendor
RUN cd /usr/local/bin && ln -s /app/vendor/bin/* .
VOLUME /app

# COPY composer* /app/
# RUN /usr/bin/composer install

ENTRYPOINT ["/docker-entrypoint.sh"]
WORKDIR /app
