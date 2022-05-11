FROM php:7.2-apache

COPY ./web-vhost.conf /etc/apache2/sites-available/000-default.conf

#sudo apt-get install libapache2-mod-php7.0
#sudo apt-get install php7.0-mysql
#sudo apt-get install php7.0-curl
#sudo apt-get install php7.0-gd
#sudo service apache2 restart

#WORKDIR /httpdocs

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install imagemagick -y
RUN apt-get install libmagickwand-dev -y
RUN pecl install imagick
RUN echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini
RUN echo "upload_max_filesize=500M" > /usr/local/etc/php/conf.d/applied.ini 
RUN echo "post_max_size=500M" >> /usr/local/etc/php/conf.d/applied.ini 
RUN echo "memory_limit=1024M" >> /usr/local/etc/php/conf.d/applied.ini
RUN echo "max_execution_time=300" > /usr/local/etc/php/conf.d/applied.ini 
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN a2enmod rewrite
RUN a2enmod expires
RUN a2enmod headers
