FROM php:7.2-cli

ENV AWS_ACCESSKEY="1"

ENV AWS_SECRETKEY="1"

ENV COMPOSER_HOME=/root/.composer

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

VOLUME /var/www/html

COPY . /var/www/html

RUN apt-get update

RUN apt-get -y install curl gnupg

RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -

RUN apt-get -y install nodejs

# Create Composer directory (cache and auth files) & Get Composer
RUN mkdir -p $COMPOSER_HOME \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN npm install

RUN composer install

CMD ["node", "index.js"]
