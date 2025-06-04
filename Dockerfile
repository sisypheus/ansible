FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
      openssh-server \
      sudo \
      python3 \
      python3-pip \
      python3-apt \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

RUN echo 'root:root' | chpasswd

RUN sed -i \
      -e 's/^#\?\(PermitRootLogin\).*$/PermitRootLogin yes/' \
      -e 's/^#\?\(PasswordAuthentication\).*$/PasswordAuthentication yes/' \
    /etc/ssh/sshd_config

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
