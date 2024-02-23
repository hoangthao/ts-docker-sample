#!/bin/bash
echo "${!OPS_@}"
echo abc | base64
for var in "${!OPS_@}"; do
    export $var=$(echo -n ${!var} | base64)
    envsubst < env-config.template.js > env-config.js
done
nginx -g 'daemon off;'