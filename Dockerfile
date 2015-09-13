FROM ubuntu:trusty
MAINTAINER Dieter Provoost <dieter.provoost@marlon.be>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y -f install software-properties-common && \
    add-apt-repository ppa:ondrej/php5 && \
    apt-get update -y

RUN locale-gen nl_BE.UTF-8
ENV LC_ALL nl_BE.UTF-8

# PHP + extensions
RUN apt-get -y -f --force-yes install php5-cli php5-dev php5-mysql php5-xmlrpc php5-curl curl libicu-dev php5-sqlite php5-memcache php-pear php5-xsl php5-mcrypt php5-gd php5-intl

RUN pecl install xdebug && \
    pecl install mongo && \
    pecl install xhprof-beta && \
    apt-get clean -y

ADD php/custom.ini /etc/php5/cli/conf.d/40-custom.ini
ADD php/mongo.ini /etc/php5/cli/conf.d/50-mongo.ini
ADD php/xhprof.ini /etc/php5/cli/conf.d/60-xhprof.ini
