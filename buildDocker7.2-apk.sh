set -e
#tagName='registry.cn-beijing.aliyuncs.com/w_docker/php7.2-fpm:2.0.2'
tagName='xytschool/php7.2:10.1.3'
latestTagName='xytschool/php7.2:latest'
docker build -t $tagName --no-cache -f Dockerfile7.2-apk .
docker push  $tagName              
docker tag  $tagName $latestTagName
#docker push $latestTagName
