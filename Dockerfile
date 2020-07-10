FROM php:7.1-cli

RUN apt-get update \
  && apt-get install -y unzip zip zlib1g-dev libpng-dev git \
  && docker-php-ext-install zip gd \
  && docker-php-ext-enable zip gd

# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
  &&  composer config platform.php 7.1.33