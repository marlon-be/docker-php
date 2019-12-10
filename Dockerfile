FROM ubuntu:bionic
MAINTAINER PHP marlon <php@marlon.be>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get install -y locales

RUN locale-gen nl_BE.UTF-8
ENV LC_ALL nl_BE.UTF-8

RUN apt-get -y -f install software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update -y

# PHP + extensions
RUN apt-get -y -f --force-yes install php7.4-cli php7.4-dev php7.4-mysql php7.4-pgsql php7.4-xmlrpc php7.4-curl curl libicu-dev php7.4-sqlite php-memcached php-pear php7.4-xsl php7.4-gd php7.4-intl php7.4-mbstring php7.4-bcmath php7.4-zip php7.4-soap
