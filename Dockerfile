# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    weorder-web
# name:     cic1988/weorder-web
# repo:     https://github.com/cic1988/weorder-web-docker.git
# Requires: ubuntu:latest
# authors:  gaoyuanhot@gmail.com
# ------------------------------------------------------

FROM node:10

WORKDIR /usr/src/app

RUN curl -o deploy.zip "https://github.com/cic1988/weorder/releases/download/v0.7.0/deploy.zip"
RUN unzip deploy.zip

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# COPY package*.json ./

RUN npm install
#COPY . .

EXPOSE 15000
CMD [ "node", "server.js" ]



