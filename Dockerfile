FROM php:8.3-apache

# Install required dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    unixodbc-dev \
    dnsutils librsvg2-bin fswatch ffmpeg nano \
    g++ \
    curl \
    gnupg \
    openssl libssl-dev \
 && rm -rf /var/lib/apt/lists/*

# Set OpenSSL to use TLS 1.2
RUN sed -i 's/DEFAULT@SECLEVEL=2/DEFAULT@SECLEVEL=1/' /etc/ssl/openssl.cnf


# Install Microsoft ODBC Driver for SQL Server
RUN curl -sS https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
 && curl -sS https://packages.microsoft.com/config/ubuntu/22.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

# Update package lists and install msodbcsql18
RUN apt-get update \
 && ACCEPT_EULA=Y apt-get install -y msodbcsql18
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

# Install SQLSRV and PDO_SQLSRV PHP extensions
RUN pecl install sqlsrv pdo_sqlsrv \
 && echo "extension=pdo_sqlsrv.so" > /usr/local/etc/php/conf.d/30-pdo_sqlsrv.ini \
 && echo "extension=sqlsrv.so" > /usr/local/etc/php/conf.d/20-sqlsrv.ini

# Enable Apache modules
RUN a2enmod rewrite

# Copy your Laravel project files into the container
COPY . /var/www/html/

# Change ownership of the web root
RUN chown -R www-data:www-data /var/www/html/

# Expose port 80
EXPOSE 80
