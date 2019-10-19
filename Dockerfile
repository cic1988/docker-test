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

USER node

WORKDIR /home/node/app
RUN wget https://release.happyanneducation.com/latest.zip && unzip *.zip && \
    mv ./deploy/* . && rm -rf deploy && rm *.zip && \
    npm install

EXPOSE 8080

CMD [ "node", "server.js" ]
