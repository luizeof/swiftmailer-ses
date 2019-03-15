FROM php:7.2-cli

ENV AWS_ACCESSKEY

ENV AWS_SECRETKEY

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY . /var/www/html

RUN apt-get update

RUN apt-get -y install curl gnupg

RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -

RUN apt-get -y install nodejs

RUN npm install

RUN composer install

CMD ["node", "index.js"]
