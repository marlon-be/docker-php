FROM ubuntu:xenial
MAINTAINER Dieter Provoost <dieter.provoost@marlon.be>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install -y locales

RUN locale-gen nl_BE.UTF-8
ENV LC_ALL nl_BE.UTF-8

RUN apt-get -y -f install software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update -y

# PHP + extensions
RUN apt-get -y -f --force-yes install php7.1-cli php7.1-dev php7.1-mysql php7.1-xmlrpc php7.1-curl curl libicu-dev php7.1-sqlite php-memcached php-pear php7.1-xsl php7.1-mcrypt php7.1-gd php7.1-intl php7.1-mbstring php7.1-bcmath php7.1-zip php7.1-soap

#RUN pecl install xdebug && \
#    pecl install mongo && \
#    pecl install xhprof-beta && \
#    apt-get clean -y

#ADD php/custom.ini /etc/php5/cli/conf.d/40-custom.ini
#ADD php/mongo.ini /etc/php5/cli/conf.d/50-mongo.ini
#ADD php/xhprof.ini /etc/php5/cli/conf.d/60-xhprof.ini
