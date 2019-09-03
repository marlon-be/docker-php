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
RUN apt-get -y -f --force-yes install php7.3-cli php7.3-dev php7.3-mysql php7.3-pgsql php7.3-xmlrpc php7.3-curl curl libicu-dev php7.3-sqlite php-memcached php-pear php7.3-xsl php7.3-gd php7.3-intl php7.3-mbstring php7.3-bcmath php7.3-zip php7.3-soap
