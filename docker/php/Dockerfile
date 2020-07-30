FROM php:7.4-fpm-alpine

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories

RUN apk update && apk upgrade \
  && apk add zlib-dev libzip-dev
RUN docker-php-ext-install zip pdo_mysql
