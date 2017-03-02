#!/bin/sh
set -e

nginx -c /etc/nginx/letsencrypt.conf

letsencrypt () {
  certbot certonly --non-interactive --agree-tos \
    --email waleedsamy634@gmail.com -a webroot \
    --webroot-path=/var/www/letsencrypt \
    -d $1
    -d $2
}

letsencrypt example.com www.example.com

nginx -c /etc/nginx/nginx.conf -t && nginx -s stop
crond
exec nginx -g 'daemon off;'
