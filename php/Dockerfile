FROM php:latest-fpm

ARG GIT_USEREMAIL
ARG GIT_USERNAME
ENV GIT_USEREMAIL $GIT_USEREMAIL
ENV GIT_USERNAME $GIT_USERNAME

ENV NODE_VERSION=16

RUN apt update \
    && apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip nano vim \
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

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -qq -y build-essential nodejs yarn
