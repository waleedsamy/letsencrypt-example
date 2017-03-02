FROM alpine:3.5

EXPOSE 80 443

RUN apk add --update openssl nginx certbot vim curl tree && rm -rf /var/cache/apk/*

RUN mkdir -p /run/nginx /var/cache/nginx /etc/ssl /var/www/letsencrypt/.well-known/acme-challenge/

RUN chown -R nginx:nginx /run/nginx /var/cache/nginx /etc/ssl /var/www/letsencrypt

RUN openssl dhparam -out /etc/ssl/dhparam.pem 2048
RUN echo -e "#!/bin/sh\n\ncertbot renew >> /certbotrenew.log 2>&1" > /etc/periodic/weekly/certbotrenew.sh && chmod +x /etc/periodic/weekly/certbotrenew.sh

COPY nginx.conf /etc/nginx/nginx.conf
COPY letsencrypt.conf /etc/nginx/letsencrypt.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
