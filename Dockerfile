FROM ubuntu:focal
LABEL org.opencontainers.image.authors="hello@pujianto.net"
ARG DEBIAN_FRONTEND=noninteractive
ARG METEOR_VERSION=
RUN DEBCONF_NONINTERACTIVE_SEEN=true
RUN sed -i -e 's#http://archive.ubuntu.com#http://us.archive.ubuntu.com#g' /etc/apt/sources.list
RUN apt-get update -y && apt-get install -y apt-utils curl
RUN apt-get install -y build-essential python
RUN apt-get upgrade -y
RUN dpkg-reconfigure ca-certificates
RUN apt-get clean -y
RUN groupadd ubuntu
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g 0 -G ubuntu -u 1000 ubuntu
RUN mkdir -p /app && chown -R ubuntu:ubuntu /app
USER ubuntu
RUN mkdir -p /home/ubuntu/.local/bin
RUN curl -s https://install.meteor.com/?release=${METEOR_VERSION} | sed -e 's#PREFIX="/usr/local"#PREFIX="/home/ubuntu/.local"#g' | sh
RUN NODE="$(find /home/ubuntu/.meteor/ -path '*bin/node' | grep '/.meteor/packages/meteor-tool/' | sort | head -n 1)" && ln -s "${NODE}" /home/ubuntu/.local/bin/node && ln -s $(dirname "${NODE}")/npm /home/ubuntu/.local/bin/npm
env PATH $PATH:/home/ubuntu/.local/bin:/home/ubuntu/.meteor/
WORKDIR /app
VOLUME /app
