FROM cimg/php:8.1.12

VOLUME /var/lib/docker

RUN deps='\
         ruby \
         postgresql-client \
         libpq-dev \
         libpng-dev \
         nasm \
         nodejs \
         npm \
         ' \
     && set -x \
     && sudo mkdir -p /usr/share/man/man7/ \
     && curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
     && sudo apt update -qq \
     && sudo apt install -y -qq $deps --no-install-recommends \
     && sudo gem install bundler hub --no-document \
     && sudo rm -rf /var/lib/apt/lists/* \
     && sudo docker-php-ext-install pdo_pgsql pcntl
