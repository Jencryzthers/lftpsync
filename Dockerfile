FROM alpine:latest
MAINTAINER Jean-Christophe Proulx <j.christophe@devjc.net>

# Set correct environment variables
ENV HOME /root

RUN apk --no-cache add lftp ca-certificates openssh

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

VOLUME /scripts

RUN /bin/bash -c "sleep 15 && while true; do /scripts/autolftp-sftp.sh ; sleep 300; done"
