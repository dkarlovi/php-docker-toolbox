FROM composer:latest

# required modules: intl imagick pcntl pdo_mysql redis xdebug
RUN apk add --update --no-cache autoconf g++ icu icu-dev inotify-tools imagemagick imagemagick-dev libltdl libtool make pcre-dev && \
    docker-php-ext-install exif intl pcntl pdo_mysql && \
    pecl install imagick redis xdebug && \
    docker-php-ext-enable imagick redis xdebug && \
    apk del autoconf g++ icu-dev imagemagick-dev pcre-dev && \
    rm -rf /tmp/pear /usr/src /usr/lib/python2.7 /usr/local/include/php /usr/local/lib/php/test /usr/local/lib/php/PEAR /usr/include /var/cache/*

ENV PATH="/toolbox/vendor/bin:${PATH}"
COPY vendor /toolbox/vendor
COPY sys/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /usr/local/etc/php/conf.d

ENTRYPOINT ["/docker-entrypoint.sh"]
WORKDIR /app
