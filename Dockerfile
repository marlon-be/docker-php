FROM ubuntu:trusty
MAINTAINER Dieter Provoost <dieter.provoost@marlon.be>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get -y -f install software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update -y

RUN locale-gen nl_BE.UTF-8
ENV LC_ALL nl_BE.UTF-8

# PHP + extensions
RUN apt-get -y -f --force-yes install php5.6-cli php5.6-dev php5.6-mysql php5.6-xmlrpc php5.6-curl curl libicu-dev php5.6-sqlite php5.6-memcache php-pear php5.6-xsl php5.6-mcrypt php5.6-gd php5.6-intl php5.6-mbstring php5.6-zip php5.6-bcmath

RUN pecl install xdebug-2.5.5 && \
    apt-get clean -y

RUN apt-get install unzip

ADD php/custom.ini /etc/php/5.6/mods-available/40-custom.ini
