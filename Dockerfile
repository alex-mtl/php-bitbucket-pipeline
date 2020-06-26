FROM php:7.1.33

RUN apt-get update \
  && apt-get install -y unzip zip zlib1g-dev libpng-dev git \
  && docker-php-ext-install zip gd \
  && docker-php-ext-install soap \
  && docker-php-ext-enable zip gd \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  && composer install --no-progress --no-suggest --optimize-autoloader