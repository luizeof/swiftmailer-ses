FROM php:7.2-cli

RUN apt-get update

RUN apt-get install -y zip unzip zlib1g-dev

RUN docker-php-ext-install zip bcmath

ENV AWS_ACCESSKEY="1"

ENV AWS_SECRETKEY="1"

ENV COMPOSER_HOME=/root/.composer

RUN mkdir -p /var/www/app

WORKDIR /var/www/app

VOLUME /var/www/html

COPY . /var/www/app

RUN apt-get update

RUN apt-get -y install curl gnupg git

RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -

RUN apt-get -y install nodejs

COPY docker-entrypoint.sh /

RUN ["chmod", "+x", "/docker-entrypoint.sh"]

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["node", "index.js"]
