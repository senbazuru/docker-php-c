FROM circleci/php:7.2
MAINTAINER senbazuru

RUN deps='\
         ruby \
         postgresql-client \
         libpq-dev \
         libpng-dev \
         nasm \
         nodejs \
         ' \
     && set -x \
     && sudo mkdir -p /usr/share/man/man7/ \
     && curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
     && sudo apt update -qq \
     && sudo apt install -y -qq $deps --no-install-recommends \
     && sudo gem install bundler hub --no-document \
     && sudo rm -rf /var/lib/apt/lists/* \
     && sudo docker-php-ext-install pdo_pgsql pcntl \
     && sudo composer global require hirak/prestissimo \
     && composer global require hirak/prestissimo

