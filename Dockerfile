FROM composer:latest

# required modules: intl pcntl pdo_mysql redis xdebug
RUN apk add --update --no-cache autoconf g++ icu icu-dev inotify-tools make && \
    docker-php-ext-install intl pcntl pdo_mysql && \
    pecl install redis xdebug && \
    docker-php-ext-enable redis xdebug && \
    apk del autoconf g++ icu-dev && rm -rf /tmp/pear /usr/src /usr/local/include/php /usr/include /var/cache/*

ENV PATH="/toolbox/vendor/bin:${PATH}"
COPY vendor /toolbox/vendor
COPY sys/docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
WORKDIR /app
