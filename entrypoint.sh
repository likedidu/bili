#!/usr/bin/env bash

biliroaming_rust_server &

cp /app/nginx.conf /etc/nginx/conf.d/server.conf 

rm -rf /etc/nginx/sites-enabled/default
nginx -g 'daemon off;'
