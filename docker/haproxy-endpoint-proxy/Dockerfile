#
# Docker file for haproxy and confd
#

# FROM ubuntu:latest
FROM dockerfile/ubuntu
MAINTAINER Joseph Muraski



# Install Haproxy.
RUN \
  sed -i 's/^# \(.*-backports\s\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y haproxy=1.5.3-1~ubuntu14.04.1 && \
  apt-get install -y wget && \
  sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy && \
  rm -rf /var/lib/apt/lists/*

# Install Confd
RUN wget -O confd https://github.com/kelseyhightower/confd/releases/download/v0.6.3/confd-0.6.3-linux-amd64
RUN mv confd /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

# Add files.
ADD haproxy-start.sh /haproxy-start
RUN chmod 755 /haproxy-start

ADD haproxy.cfg /etc/haproxy/haproxy.cfg
ADD logging.conf /etc/rsyslog.d/haproxy.conf


RUN mkdir -p /etc/confd/conf.d
RUN mkdir -p /etc/confd/templates
ADD haproxy.toml /etc/confd/conf.d/haproxy.toml
ADD haproxy.cfg.tmpl /etc/confd/templates/haproxy.cfg.tmpl

# Define mountable directories.
VOLUME ["/etc/haproxy", "/var/log", "/etc/confd"]

# Define working directory.
WORKDIR /etc/haproxy

# Expose ports.
EXPOSE 80
EXPOSE 443

# Define default command.
CMD ["bash", "/haproxy-start"]
