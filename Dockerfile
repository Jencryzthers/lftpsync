FROM rastasheep/ubuntu-sshd:14.04
MAINTAINER Jean-Christophe Proulx <j.christophe@devjc.net>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

RUN apt-get update -q

# Install LFTP / openssh
RUN apt-get install -qy openssh lftp

VOLUME /scripts

RUN /bin/bash -c "sleep 15 && while true; do /scripts/autolftp-sftp.sh ; sleep 300; done"
