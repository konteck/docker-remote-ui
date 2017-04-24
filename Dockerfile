FROM ubuntu:16.04

MAINTAINER 3.14.lot

# install ubuntu common stuff
RUN apt-get update
RUN apt-get install -yq apt-utils wget iputils-ping htop curl sudo software-properties-common

# x2go-server
RUN add-apt-repository ppa:x2go/stable
RUN apt-get update
RUN apt-get install x2goserver x2goserver-xsession

