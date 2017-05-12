FROM alpine:latest
MAINTAINER Jean-Christophe Proulx <j.christophe@devjc.net>

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN apk --no-cache add lftp ca-certificates openssh

VOLUME /scripts
RUN /bin/bash -c "sleep 15 && while [ -f /scripts/autolftp-sftp.sh ]; do /scripts/autolftp-sftp.sh; sleep 300; done"
