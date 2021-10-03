FROM node:12.18.3
ARG DEBIAN_FRONTEND=noninteractive
LABEL org.opencontainers.image.authors="hello@pujianto.net"
RUN DEBCONF_NONINTERACTIVE_SEEN=true
RUN apt-get update -y && apt-get install -y apt-utils curl 
RUN apt-get install -y build-essential python
RUN apt-get upgrade -y 
RUN dpkg-reconfigure ca-certificates
RUN curl https://install.meteor.com/ -vvv | sh
RUN useradd node 
USER node 
