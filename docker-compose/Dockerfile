FROM php:7.4

# System dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zlib1g-dev \
    libzip-dev \
    default-mysql-client \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Scripts & Entrypoint
ENV COMPOSER_VERSION=1.10.9
ENV NODE_VERSION=12.18.3

RUN mkdir -p /home/scripts
COPY scripts/* /home/scripts/
RUN chmod 755 /home/scripts/* && ln -sf /home/scripts/* /usr/bin/ && install_composer.sh && install_node.sh
ENTRYPOINT ["/home/scripts/entrypoint.sh"]
RUN composer global require laravel/installer
ENV PATH="/root/.composer/vendor/bin:${PATH}"

# SSH
RUN mkdir /root/.ssh
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
RUN echo "IdentityFile /run/secrets/sshkey" >> /root/.ssh/config

RUN rm -rf /var/www/html
WORKDIR /var/www

EXPOSE 8000
EXPOSE 3000
EXPOSE 3001
