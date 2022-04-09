FROM php:8.0-fpm

ARG GIT_USEREMAIL
ARG GIT_USERNAME
ENV GIT_USEREMAIL $GIT_USEREMAIL
ENV GIT_USERNAME $GIT_USERNAME

RUN apt update \
    && apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip \
    && docker-php-ext-install intl opcache pdo pdo_mysql \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

WORKDIR /var/www/docker_sf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony
RUN git config --global user.email "${GIT_USEREMAIL}" \ 
    && git config --global user.name "${GIT_USERNAME}"