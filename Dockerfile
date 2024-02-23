#React app image
FROM node:lts-alpine as builder

WORKDIR /app

COPY package*.json ./

# The `npm ci` command can only install with an existing package-lock.json
RUN npm ci
# RUN npm install

# ENV JQ_VERSION=1.6
# RUN wget --no-check-certificate https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 -O /tmp/jq-linux64
# RUN cp /tmp/jq-linux64 /usr/bin/jq
# RUN chmod +x /usr/bin/jq

COPY . .

# RUN jq 'to_entries | map_values({ (.key) : ("$" + .key) }) | reduce .[] as $item ({}; . + $item)' ./src/config.json > ./src/config.tmp.json && mv ./src/config.tmp.json ./src/config.json

# RUN cat ./src/config.json

ARG abc_env
ENV ABC $abc_env
RUN npm run build

FROM nginx:latest as prod
# FROM nginx:stable-alpine

COPY --from=builder /app/dist /usr/share/nginx/html
COPY config/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 9090

# ENV JSFOLDER=/usr/share/nginx/html/assets/*.js
# COPY config/start-nginx.sh /usr/bin/start-nginx.sh
# RUN chmod +x /usr/bin/start-nginx.sh

# CMD ["nginx", "-g", "daemon off;"]
# ENTRYPOINT [ "start-nginx.sh" ]
# CMD ["/usr/bin/start-nginx.sh"]

WORKDIR /usr/share/nginx/html
COPY config/start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh
CMD ["/usr/bin/start.sh"]