#!/usr/bin/env bash

biliroaming_rust_server &
caddy run --config /app/Caddyfile --adapter caddyfile
