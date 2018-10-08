#!bin/bash

# 主目录
path=$(pwd)/Tool/3

# nginx
docker run \
    --name nginx \
    -d \
    --restart=always \
    -p 80:80/tcp \
    -p 8680:8680 \
    -p 8681:8681 \
    -p 8682:8682 \
    -p 8683:8683 \
    -p 8684:8684 \
    -p 8685:8685 \
    -p 8686:8686 \
    -p 8687:8687 \
    -p 8688:8688 \
    -p 8689:8689 \
    -p 8690:8690 \
    -v $path/nginx/nginx.conf:/etc/nginx/nginx.conf \
    -v $path/nginx/conf/:/etc/nginx/conf/ \
    nginx:1.15.5-alpine

    

