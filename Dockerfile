# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    weorder-web
# name:     cic1988/weorder-web
# repo:     https://github.com/cic1988/weorder-web-docker.git
# Requires: ubuntu:latest
# authors:  gaoyuanhot@gmail.com
# ------------------------------------------------------

FROM ubuntu:18.04

ARG VERSION=v1.7.8+hotfix.4

ENV FLUTTER_PATH=/flutter/bin

WORKDIR /

# Install flutter
RUN apt-get update &&\
 apt-get install -y lcov git-core curl unzip libglu1 lib32stdc++6 &&\
 git clone --branch ${VERSION} --depth=1 https://github.com/flutter/flutter.git &&\
 ${FLUTTER_PATH}/flutter doctor &&\
 apt-get remove -y curl unzip &&\
 apt autoremove -y &&\
 rm -rf /var/lib/apt/lists/*

ENV PATH $PATH:${FLUTTER_PATH}/cache/dart-sdk/bin:${FLUTTER_PATH}

# TODO: check flutter version > 1.5.4
# Install webdev for flutter for web
# see: https://github.com/flutter/flutter_web
RUN flutter pub global activate webdev
ENV PATH $PATH:$HOME/.pub-cache/bin



