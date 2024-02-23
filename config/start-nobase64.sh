#!/bin/sh
export EXISTING_VARS=$(printenv | grep '^OPS_*' | awk -F= '{print $1}' | sed 's/^/\$/g' | paste -sd,);
echo $EXISTING_VARS
envsubst $EXISTING_VARS < env-config.template.js > env-config.js
nginx -g 'daemon off;'