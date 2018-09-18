#!bin/bash
#系统环境

# 环境初始化
SystemInit()
{
	apt-get update

    # 安装依赖
    apt-get install -y gcc libxml2 libxml2-dev build-essential libexpat1-dev libgeoip-dev libpng-dev libpcre3-dev libssl-dev rcs zlib1g-dev
    apt-get install -y make autoconf wget vim git libmcrypt-dev libcurl4-openssl-dev libjpeg-dev libpng-dev libwebp-dev pkg-config
    apt-get install -y composer graphviz cmake

    # 创建日志等文件
    mkdir -p '/tmp/log/'
}