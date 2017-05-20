#!/bin/bash

# first param looks like a flag or is a valid filename
if [ "$(printf %c "${1}")" = '-' -o -e "${1}" ]; then
  set -- /sbin/tini -- php "$@";
fi

exec "${@}";
