FROM ubuntu:xenial
MAINTAINER Dieter Provoost <dieter.provoost@marlon.be>

ENV DEBIAN_FRONTEND noninteractive

#RUN apt-get -y -f install software-properties-common && \
#    add-apt-repository ppa:ondrej/php5-5.6 && \
#    apt-get update -y
RUN apt-get update -y && apt-get install -y locales

RUN locale-gen nl_BE.UTF-8
ENV LC_ALL nl_BE.UTF-8

# PHP + extensions
RUN apt-get -y -f --force-yes install php7.0-cli php7.0-dev php7.0-mysql php7.0-xmlrpc php7.0-curl curl libicu-dev php7.0-sqlite php-memcached php-pear php7.0-xsl php7.0-mcrypt php7.0-gd php7.0-intl php7.0-mbstring php7.0-bcmath php7.0-zip php7.0-soap

#RUN pecl install xdebug && \
#    pecl install mongo && \
#    pecl install xhprof-beta && \
#    apt-get clean -y

#ADD php/custom.ini /etc/php5/cli/conf.d/40-custom.ini
#ADD php/mongo.ini /etc/php5/cli/conf.d/50-mongo.ini
#ADD php/xhprof.ini /etc/php5/cli/conf.d/60-xhprof.ini
