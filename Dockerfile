# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    weorder-web
# name:     cic1988/weorder-web
# repo:     https://github.com/cic1988/weorder-web-docker.git
# Requires: ubuntu:latest
# authors:  gaoyuanhot@gmail.com
# ------------------------------------------------------

FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules

WORKDIR /home/node/app

RUN apk --no-cache add curl && \
    curl -s https://api.github.com/repos/cic1988/weorder-web-docker/releases/latest \
    | grep "browser_download_url.*zip" \
    | cut -d '"' -f 4 \
    | xargs wget -O deploy.zip && \
    unzip deploy.zip && \
    cd deploy && \
    chown -R node:node /home/node/app && \
    npm install

EXPOSE 8080
CMD [ "node", "server.js" ]



