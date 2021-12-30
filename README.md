# Unofficial Meteorjs Docker Image

A base Meteor docker image with regular user (ubuntu)
Run as `ubuntu` user. Meteor libraries located in `/home/ubuntu/.meteor`, project workdir located in `/app` 

#### Available tags:
- see https://hub.docker.com/r/pujianto/meteorjs/tags

Since this image runs as `ubuntu` user, when create a new docker image based on this image, you need to add with additional flag, `--chown=ubuntu:ubuntu`.
For example: `ADD . /app --chown=ubuntu:ubuntu`
