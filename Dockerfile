FROM php:7.0-apache
RUN echo "deb http://www.deb-multimedia.org jessie main non-free" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y --force-yes \
        git \
        libfreetype6-dev \
        ffmpeg \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# Install Composer and make it available in the PATH
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Set the WORKDIR to /app so all following commands run in /app
WORKDIR /var/www/html

COPY . ./

RUN chmod -R 0777 ./

# Install dependencies with Composer.
RUN composer install --prefer-source --no-interaction

