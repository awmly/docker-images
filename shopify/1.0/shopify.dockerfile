FROM ubuntu:18.04

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
RUN echo $TZ > /etc/timezone

# core apt
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y curl

#node
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
# RUN npm install -g npx

#themekit
RUN curl -s https://shopify.github.io/themekit/scripts/install.py | python

#change dir
WORKDIR /build

#entrypoint
COPY ./shopify-entrypoint /usr/local/bin/
RUN chmod +x /usr/local/bin/shopify-entrypoint
ENTRYPOINT ["/usr/local/bin/shopify-entrypoint"]