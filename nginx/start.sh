#!/bin/bash

[ ! -z "${PROXY_USER}" ] && sed -i "s/PROXY_USER/${PROXY_USER}/" /etc/nginx/nginx.conf

/usr/sbin/nginx -g "daemon off;"