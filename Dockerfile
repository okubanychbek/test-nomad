FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    && docker-php-ext-install zip pdo_mysql


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN a2enmod rewrite && service apache2 restart

COPY apache-config.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html

ENV APACHE_DOCUMENT_ROOT /var/www/html/public

EXPOSE 80
