FROM ubuntu:16.04

MAINTAINER 3.14.lot

#RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update

ENV DEBIAN_FRONTEND noninteractive

# install ubuntu common stuff
RUN apt-get -qq update
RUN apt-get install -qq apt-utils iputils-ping wget htop curl sudo software-properties-common > /dev/null

# x2go-server
RUN add-apt-repository ppa:x2go/stable
RUN apt-get -qq update
RUN apt-get install -qq x2goserver x2goserver-xsession > /dev/null

# set openbox
RUN apt-get install -qq openbox > /dev/null

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN service ssh restart

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
