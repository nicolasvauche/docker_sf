FROM php:8.1-fpm

ARG GIT_USEREMAIL
ARG GIT_USERNAME
ENV GIT_USEREMAIL $GIT_USEREMAIL
ENV GIT_USERNAME $GIT_USERNAME

ENV NODE_VERSION=18

RUN apt update \
    && apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip nano vim \
    && docker-php-ext-install intl opcache pdo pdo_mysql exif \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

#--- PHP GD (GraphicDraw)
RUN apt-get update && \
    apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev --no-install-recommends --fix-missing\
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/\
    && docker-php-ext-install gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sS 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
RUN apt install symfony-cli

RUN git config --global user.email "${GIT_USEREMAIL}" \
    && git config --global user.name "${GIT_USERNAME}"

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -qq -y build-essential nodejs yarn

COPY php.ini /usr/local/etc/php/php.ini

COPY .bashrc /root/.bashrc

WORKDIR /var/www/docker_sf
