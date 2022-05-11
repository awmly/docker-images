FROM ubuntu:18.04

# set timezone
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
RUN echo $TZ > /etc/timezone

# core apt
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y curl
RUN apt-get install -y gnupg2
RUN apt-get install -y mysql-server

# composer
RUN apt-get install -y php7.2
RUN apt-get install -y php7.2-curl
RUN apt-get install -y php7.2-mysql
RUN apt-get install -y php7.2-xml
RUN apt-get install -y wget
RUN apt-get install -y git
RUN apt-get install -y zip
RUN apt-get install -y unzip
COPY ./build-composer /usr/local/bin/
RUN bash /usr/local/bin/build-composer
RUN mv composer.phar /usr/local/bin/composer

# imagick
RUN apt-get install php-dev -y
RUN apt-get install php-pear -y
RUN apt-get install imagemagick -y
RUN apt-get install libmagickwand-dev -y
RUN pecl install imagick
RUN echo "extension=imagick.so" > /etc/php/7.2/cli/conf.d/ext-imagick.ini

# node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential
RUN npm i -g npm
# RUN npm install -g npx
RUN npm install -g firebase-tools

# set workdir
RUN mkdir /build-ro
WORKDIR /build-ro
#WORKDIR /build

# entry point
COPY ./build-entrypoint /usr/local/bin/
RUN chmod +x /usr/local/bin/build-entrypoint
ENTRYPOINT ["/usr/local/bin/build-entrypoint"]
