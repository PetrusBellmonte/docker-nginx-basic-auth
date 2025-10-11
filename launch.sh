#!/bin/sh

# Check required environment variables
: "${FORWARD_HOST:?FORWARD_HOST is not set}"
: "${FORWARD_PORT:?FORWARD_PORT is not set}"
: "${HTPASSWD:?HTPASSWD is not set}"

rm /etc/nginx/conf.d/default.conf || :
envsubst '$FORWARD_HOST $FORWARD_PORT' < auth.conf > /etc/nginx/conf.d/auth.conf
envsubst '$HTPASSWD' < auth.htpasswd > /etc/nginx/auth.htpasswd

exec nginx -g "daemon off;"
