#!bin/bash

# 定义 安装 PHP 版本 / 及其路径
    php_version='php-7.2.9'
    php_path="/tmp/$php_version"

# 环境初始化 / 安装依赖
    apt-get update
    apt-get install -y gcc libxml2 libxml2-dev build-essential libexpat1-dev libgeoip-dev libpng-dev libpcre3-dev libssl-dev rcs zlib1g-dev
    apt-get install -y make autoconf wget vim git libmcrypt-dev libcurl4-openssl-dev libjpeg-dev libpng-dev libwebp-dev pkg-config
    apt-get install -y graphviz cmake


# php 编译安装
    wget http://jp2.php.net/distributions/$php_version.tar.gz -P /tmp

    tar -xzvf $php_path.tar.gz -C /tmp
    rm $php_path.tar.gz

    # 编译安装
      # --prefix 安装目录
      # --with-config-file-path 指定php.ini位置
      # --enable-fpm 开启fpm模式
    $php_path/configure \
        --prefix=/usr/local/php \
        --with-config-file-path=/usr/local/php/etc \
        --enable-fpm
    make
    make install

    # 增加软连接 - 环境变量
    ln -s /usr/local/php/bin/php /usr/bin/
    ln -s /usr/local/php/bin/phpize /usr/bin/
    ln -s /usr/local/php/bin/php-config /usr/bin/
    ln -s /usr/local/php/bin/php-cgi /usr/bin/
    ln -s /usr/local/php/sbin/php-fpm /usr/bin/

    # 修改 php.ini 位置及其默认属性，默认使用production
    cp $php_path/php.ini-* /usr/local/php/etc
    cp /usr/local/php/etc/php.ini-production /usr/local/php/etc/php.ini

    # 修改fpm相关配置
    cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
    cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf
    sed -i "s/nobody/www-data/g" /usr/local/php/etc/php-fpm.d/www.conf
    sed -i "s/127.0.0.1/0.0.0.0/g" /usr/local/php/etc/php-fpm.d/www.conf

# PHP扩展安装
    # 安装 mbstring 扩展
    /usr/local/php/bin/phpize $php_path/ext/mbstring
    $php_path/ext/mbstring/configure
    make
    make install
    sed -i "s/;extension=mbstring/extension=mbstring/g" /usr/local/php/etc/php.ini

    # 安装 openssl 扩展
    mv $php_path/ext/openssl/config0.m4 $php_path/ext/openssl/config.m4
    /usr/local/php/bin/phpize $php_path/ext/openssl
    $php_path/ext/openssl/configure
    make
    make install
    sed -i "s/;extension=openssl/extension=openssl/g" /usr/local/php/etc/php.ini

    # 安装 xhprof 扩展
    git clone https://github.com/longxinH/xhprof.git $php_path/ext/xhprof
    /usr/local/php/bin/phpize $php_path/ext/xhprof/extension
    $php_path/ext/xhprof/extension/configure
    make
    make install
    echo '[xhprof]' >> /usr/local/php/etc/php.ini
    echo 'extension=xhprof.so' >> /usr/local/php/etc/php.ini
    echo 'xhprof.output_dir=/tmp/log/xhprof' >> /usr/local/php/etc/php.ini