FROM ubuntu:24.04 AS builder

ENV RUNLEVEL=1
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y curl vim rsyslog systemd gpg gzip libsasl2-modules mawk openjdk-11-jre openjdk-11-jre-headless postfix sudo symlinks tar
RUN echo "exit 0" > /etc/init.d/rsyslog && chmod +x /etc/init.d/rsyslog

RUN echo exit 0 > /usr/sbin/policy-rc.d

CMD ["/sbin/init"] 

FROM builder AS build1
