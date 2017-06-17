#!/bin/bash

if [ "${XDEBUG_ENABLE}" != "1" ]; then
    rm -f /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
fi

# first param looks like a flag or is a valid filename
if [ "$(printf %c "${1}")" = '-' -o -e "${1}" ]; then
  set -- /sbin/tini -- php "$@";
fi

exec "${@}";
