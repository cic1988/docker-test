# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    weorder-web-docker
# name:     cic1988/weorder-web-docker
# repo:     https://github.com/cic1988/weorder-web-docker.git
# authors:  gaoyuanhot@gmail.com
# ------------------------------------------------------

FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && \
    chown -R node:node /home/node/app && \
    apk --no-cache add curl

WORKDIR /home/node/app

USER node

RUN curl -s https://api.github.com/repos/cic1988/weorder-web-docker/releases/latest \
    | grep "browser_download_url.*zip" \
    | cut -d '"' -f 4 \
    | xargs wget -O deploy.zip && \
    unzip deploy.zip && \
    cp -r deploy/* . && \
    rm -rf deploy* && \
    npm install

EXPOSE 8080
CMD [ "node", "server.js" ]



