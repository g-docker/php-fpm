#FROM  registry.cn-beijing.aliyuncs.com/w_docker/alpine
#FROM  php:7.2.29-fpm-alpine3.11 
FROM daocloud.io/php:7.2-fpm-alpine
MAINTAINER gw123  <963353840@qq.com>
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN  mkdir -p /data/wwwroot 
WORKDIR /data/wwwroot
#RUN  adduser -D -s /sbin/nologin -h /data/wwwroot www
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
RUN apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        curl-dev \
        imagemagick-dev \
        libtool \
        libxml2-dev \
    && apk add --no-cache \
        curl \
        git \
        imagemagick \
    && pecl install imagick \
    && docker-php-ext-enable imagick

RUN docker-php-ext-install \
        curl \
        iconv \
        mbstring \
        pdo \
        pdo_mysql \
        xml 

RUN rm -rf /var/cache/apk/* 

EXPOSE  9000

#把entrypoint 交给其他 k8s ，docker-compose 指定方便调试
#ENTRYPOINT ["php-fpm","-F"]
