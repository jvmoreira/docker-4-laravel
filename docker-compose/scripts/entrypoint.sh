#!/bin/bash

if ! $(composer -V | grep -q "${COMPOSER_VERSION}"); then
    install_composer.sh
fi

if ! $(node -v | grep -q "${NODE_VERSION}"); then
    install_node.sh
fi

cd /var/www/

if [ ! -f artisan ]; then
    laravel new project --auth
    mv project/* ./; mv project/.* ./; rmdir project;
    php artisan storage:link
    perl -pi -e 's/(?<=DB_HOST=).*/mysql.local/' .env.example
    cp -f .env.example .env
    php artisan key:generate
fi

if [ ! -f artisan ]; then
    composer install
fi

wait-for-it.sh mysql.local:3306 -s -t 90 -- \
    echo "MySQL connection established"

mysql -h mysql.local -u root -e "CREATE DATABASE IF NOT EXISTS laravel;"
php artisan migrate

php artisan serve --host 0.0.0.0
