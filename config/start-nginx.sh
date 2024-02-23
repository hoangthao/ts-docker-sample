#!/bin/sh
export EXISTING_VARS=$(printenv | grep '^VITE_*' | awk -F= '{print $1}' | sed 's/^/\$/g' | paste -sd,);
# export EXISTING_VAR="$VITE_SECRETS"
echo $EXISTING_VARS
for file in $JSFOLDER;
do
  # cat $file | envsubst $EXISTING_VARS | tee $file
  echo $file
done
nginx -g 'daemon off;'