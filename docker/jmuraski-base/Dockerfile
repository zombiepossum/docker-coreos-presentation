#
# Docker file for for base Ubuntu Image
#

FROM ubuntu:14.04
MAINTAINER Joseph Muraski


RUN apt-get update && \
  apt-get install -y zsh && \
  apt-get install -y git-core && \
  apt-get install -y curl && \
  apt-get install -y wget && \
  rm -rf /var/lib/apt/lists/*

RUN chsh -s /bin/zsh

ENV HOME /root

WORKDIR /root

RUN git clone https://github.com/jmuraski/oh-my-zsh.git

RUN mv oh-my-zsh .oh-my-zsh

ADD profile.zshrc /root/.zshrc

CMD ["zsh"]
