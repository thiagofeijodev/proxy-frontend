#!/bin/bash

sed -i -e "s,BASE_URL_S3,""$BASE_URL_S3"",g" /etc/nginx/conf.d/default.conf
sed -i -e "s,BASE_DOMAIN,""$BASE_DOMAIN"",g" /etc/nginx/conf.d/default.conf
sed -i -e "s,BASE_EXTENSION,""$BASE_EXTENSION"",g" /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'