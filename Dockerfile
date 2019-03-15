FROM php:7.2-cli

ENV AWS_ACCESSKEY="1"

ENV AWS_SECRETKEY="1"

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

VOLUME /var/www/html

COPY . /var/www/html

RUN apt-get update

RUN apt-get -y install curl gnupg

RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -

RUN apt-get -y install nodejs

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

RUN php composer-setup.php --install-dir=bin --filename=composer

RUN npm install

RUN composer install

CMD ["node", "index.js"]
