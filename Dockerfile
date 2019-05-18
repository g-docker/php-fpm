FROM  registry.cn-beijing.aliyuncs.com/w_docker/alpine
MAINTAINER gw123  <963353840@qq.com>

WORKDIR /data/wwwroot
COPY    ./php7 /etc/php7  
RUN mkdir -p /data/wwwroot&&adduser -D -s /sbin/nologin -h /data/wwwroot www
RUN apk add php7 php7-fpm php7-mysqli php7-pdo_mysql php7-mbstring php7-curl\
        php7-json php7-zlib php7-gd php7-intl php7-session php7-tokenizer\
	php7-openssl php7-mysqlnd php7-mysqli php7-zip php7-pdo php7-dom\
	php7-xml php7-fileinfo php7-xmlwriter &&\
	rm -f /var/cache/apk/*\
#RUN apk add composer && composer global require "laravel/installer"
EXPOSE 9000
#CMD /startup1.sh
ENTRYPOINT ["php-fpm7","-F"]
