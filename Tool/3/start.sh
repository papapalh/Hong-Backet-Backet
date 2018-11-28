#!bin/bash

# 配置主目录
config_path='/home/vagrant/data/Hong-Backet-Backet'

# 资源主目录
source_path='/home/vagrant/data'

# nginx
docker run \
    --name nginx \
    -d \
    -p 0.0.0.0:80:80/tcp \
    -p 0.0.0.0:8680:8680 \
    -p 0.0.0.0:8681:8681 \
    -p 0.0.0.0:8682:8682 \
    -p 0.0.0.0:8683:8683 \
    -p 0.0.0.0:8684:8684 \
    -p 0.0.0.0:8685:8685 \
    -p 0.0.0.0:8686:8686 \
    -p 0.0.0.0:8687:8687 \
    -p 0.0.0.0:8688:8688 \
    -p 0.0.0.0:8689:8689 \
    -p 0.0.0.0:8690:8690 \
    -v $config_path/Tool/3/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v $config_path/Tool/3/nginx/conf/:/etc/nginx/conf/ \
    -v $source_path:/data \
    --restart=always \
    nginx:1.15.5-alpine

# php7.2
docker run \
    --name php \
    -itd \
    --restart=always \
    -p 3000:9000 \
    -v $source_path:/data \
    papapalh/h-php:1.0

# mysql8
docker run \
    --name mysql8 \
    --restart=always \
    -d \
    -p 0.0.0.0:3306:3306/tcp \
    -e MYSQL_ROOT_PASSWORD='Wxj920127' \
    mysql:8

# redis 
docker run \
    --name redis \
    --restart=always \
    -d \
    -p 0.0.0.0:6379:6379/tcp \
    redis

# mongodb
docker run \
    --name mongodb \
    --restart=always \
    -d \
    -p 0.0.0.0:27017:27017/tcp \
    bitnami/mongodb

