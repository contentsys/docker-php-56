FROM php:5.6.21-apache
WORKDIR /var/www/html/

#RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install vim libmcrypt-dev libxml2-dev libzip-dev libpng-dev -y
RUN docker-php-ext-install mysql mysqli pdo_mysql gettext mbstring mcrypt soap zip bcmath gd
#VOLUME ["/var/www/html"]
RUN a2enmod rewrite
#RUN sed -ri 's/^www-data:x:82:82:/www-data:x:1000:50:/' /etc/passwd

COPY php.ini /usr/local/etc/php/conf.d