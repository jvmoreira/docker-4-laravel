#!/bin/bash

echo Installing Composer v${COMPOSER_VERSION}...

mkdir -p /home/composer/v${COMPOSER_VERSION} \
    && cd /home/composer/v${COMPOSER_VERSION}

curl https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar -s -o ./composer.phar \
    && chmod 755 ./composer.phar && ln -sf /home/composer/v${COMPOSER_VERSION}/composer.phar /usr/bin/composer

echo Installation complete!
