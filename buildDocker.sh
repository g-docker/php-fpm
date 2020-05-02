tagName='registry.cn-beijing.aliyuncs.com/w_docker/php7.2-fpm:2.0.2'
tagName='xytschool/php7.2:2.0.2'
docker build -t $tagName --no-cache .
docker push  $tagName              

