FROM debian:wheezy

# Install Java.
RUN apt-get update && \
  apt-get  -y install curl
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN curl -L  https://github.com/coreos/etcd/releases/download/v0.5.0-alpha.1/etcd-v0.5.0-alpha.1-linux-amd64.tar.gz -o etcd-v0.5.0-alpha.1-linux-amd64.tar.gz
RUN tar xzvf etcd-v0.5.0-alpha.1-linux-amd64.tar.gz
RUN mv etcd-v0.5.0-alpha.1-linux-amd64 /bin/etcd

ENV PATH $PATH:/bin/etcd

ADD run.sh /run.sh
RUN chmod +x /*.sh

CMD ["/run.sh"]
