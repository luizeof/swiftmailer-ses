#!/bin/bash

set -e

# Create Composer directory (cache and auth files) & Get Composer
mkdir -p $COMPOSER_HOME \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

cd /var/www/app && npm install

cd /var/www/app && composer install
