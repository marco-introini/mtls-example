FROM php:8.2-apache

USER root

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libonig-dev \
        zip \
        curl \
        unzip \
    && docker-php-ext-install zip \
    && docker-php-source delete

COPY certs/ssl.crt /etc/apache2/ssl/ssl.crt
COPY certs/ssl.key /etc/apache2/ssl/ssl.key
RUN mkdir -p /etc/apache2/log/

RUN ln -s /etc/apache2/mods-available/ssl.load  /etc/apache2/mods-enabled/ssl.load

COPY conf/apache.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite