FROM  registry.cn-zhangjiakou.aliyuncs.com/w_docker/w_alpine:latest

MAINTAINER gw123  <963353840@qq.com>

WORKDIR /data/wwwwroot
VOLUME /data/wwwroot
copy  ./conf /etc/php7/

RUN apk add php7 php7-fpm php7-mysqli php7-pdo_mysql php7-mbstring\
        php7-json php7-zlib php7-gd php7-intl php7-session &&\
	rm -f /var/cache/apk/*\
EXPOSE 9000
#CMD /startup1.sh
ENTRYPOINT ["php-fpm7","-F"]
