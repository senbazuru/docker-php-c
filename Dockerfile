FROM circleci/php:7.2-node-browsers
MAINTAINER senbazuru

RUN deps='\
         ruby \
         postgresql-client \
         libpq-dev \
         libpng-dev \
         nasm \
         ' \
     && set -x \
     && sudo mkdir -p /usr/share/man/man7/ \
     && sudo apt update -qq \
     && sudo apt install -y -qq $deps --no-install-recommends \
     && sudo gem install bundler -N \
     && sudo rm -rf /var/lib/apt/lists/* \
     && sudo docker-php-ext-install pdo_pgsql \
     && composer global require hirak/prestissimo

