FROM ubuntu:latest
MAINTAINER Dieter Provoost <dieter.provoost@marlon.be>

RUN apt-get update

RUN apt-get -y -f install python-software-properties
RUN add-apt-repository ppa:ondrej/php5

RUN echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise main universe' >> /etc/apt/sources.list.d/universe.sources.list
RUN echo 'deb-src http://us.archive.ubuntu.com/ubuntu/ precise main universe' >> /etc/apt/sources.list.d/universe-src.sources.list

RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo "root:root" | chpasswd

# PHP + extensions
RUN apt-get -y -f install php5-cli php5-dev php5-mysql php5-xmlrpc php5-curl curl libicu-dev php5-sqlite php5-memcache php-pear php5-xsl php5-mcrypt php5-gd

# Setup SSH
RUN echo " IdentityFile /root/.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN echo " StrictHostKeyChecking no" >> /etc/ssh/ssh_config

RUN pecl install xdebug

ADD php/custom.ini /etc/php5/cli/conf.d/40-custom.ini

RUN pecl install mongo
ADD php/mongo.ini /etc/php5/cli/conf.d/50-mongo.ini

RUN pecl install xhprof-beta
ADD php/xhprof.ini /etc/php5/cli/conf.d/60-xhprof.ini

# composer and git support
RUN apt-get install -y git-core
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin && mv /usr/local/bin/composer.phar /usr/local/bin/composer

RUN apt-get clean -y
