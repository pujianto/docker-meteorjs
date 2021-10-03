FROM node:12.18.3
ARG DEBIAN_FRONTEND=noninteractive
LABEL org.opencontainers.image.authors="hello@pujianto.net"
RUN DEBCONF_NONINTERACTIVE_SEEN=true
RUN apt-get update -y && apt-get install -y apt-utils curl 
RUN apt-get install -y build-essential python
RUN apt-get upgrade -y 
RUN dpkg-reconfigure ca-certificates
USER node 
RUN mkdir -p /home/node/.npm-global
RUN npm config set prefix '~/.npm-global'
RUN echo "export PATH=~/.npm-global/bin:$PATH" >> '~/.profile'
RUN source ~/.profile
RUN npm install -g meteor
