#FROM  registry.cn-zhangjiakou.aliyuncs.com/w_docker/w_alpine:latest
FROM  registry.cn-hangzhou.aliyuncs.com/w_docker/alpine:3.8

MAINTAINER gw123  <963353840@qq.com>

WORKDIR /data/wwwwroot
VOLUME /data/wwwroot
copy  ./conf /etc/php7/

RUN apk add php7 php7-fpm php7-mysqli php7-pdo_mysql php7-mbstring\
        php7-json php7-zlib php7-gd php7-intl php7-session php7-tokenizer\
	php7-openssl php7-mysqlnd php7-mysqli php7-zip php7-pdo php7-dom\
	php7-xml php7-fileinfo php7-xmlwriter &&\
	rm -f /var/cache/apk/*\
#RUN apk add composer && composer global require "laravel/installer"
EXPOSE 9000
#CMD /startup1.sh
ENTRYPOINT ["php-fpm7","-F"]