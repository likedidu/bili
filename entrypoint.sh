#!/usr/bin/env bash

biliroaming_rust_server &

rm -rf /etc/nginx/sites-enabled/default
nginx -g 'daemon off;'
