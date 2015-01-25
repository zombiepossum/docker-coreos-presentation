#
# Docker file for for base Debian Image
#

FROM jmuraski/jmuraski-base:latest
MAINTAINER Joseph Muraski

RUN apt-get update -y && \
  apt-get install --no-install-recommends -y -q build-essential && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir /nodejs

RUN curl http://nodejs.org/dist/v0.10.31/node-v0.10.31-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1

ENV PATH $PATH:/nodejs/bin
