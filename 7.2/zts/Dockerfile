#
# NOTE: Automatically generated via "update.sh"
# DON'T EDIT MANUALLY
#

# Base PHP image
FROM php:7.2-zts-alpine

# Dev dependencies
RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    curl-dev \
    icu-dev \
    libpng-dev \
    libxml2-dev \
    libzip-dev \
    postgresql-dev \
    sqlite-dev

# Production dependencies
RUN apk add --no-cache \
    curl

# Install PHP Extensions
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-configure intl
RUN docker-php-ext-install \
    bcmath \
    curl \
    gd \
    intl \
    json \
    mbstring \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    pdo_sqlite \
    pcntl \
    tokenizer \
    xml \
    zip

# Install Composer
ENV COMPOSER_HOME /composer
ENV PATH ./vendor/bin:/composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# Delete apk build-deps/
RUN apk del -f .build-deps

# Set working directory
WORKDIR /var/www
