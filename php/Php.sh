#!bin/bash
#PHP编译安装

PhpInstall()
{
    # 官网拉取PHP版本
    wget http://jp2.php.net/distributions/$php_version.tar.gz -P /tmp

    # 解压/删除压缩包
    tar -xzvf $php_dir.tar.gz -C /tmp
    rm $php_dir.tar.gz

    # 编译安装
        # --prefix 安装目录
        # --with-config-file-path 指定php.ini位置
        # --enable-fpm 开启fpm模式

    $php_dir/configure \
        --prefix=/usr/local/php \
        --with-config-file-path=/usr/local/php/etc \
        --enable-fpm

    make&&make install

    # 增加软连接 - 环境变量
    ln -s /usr/local/php/bin/php /usr/bin/
    ln -s /usr/local/php/bin/phpize /usr/bin/
    ln -s /usr/local/php/bin/php-config /usr/bin/
    ln -s /usr/local/php/bin/php-cgi /usr/bin/
    ln -s /usr/local/php/sbin/php-fpm /usr/bin/

    # 修改 php.ini 位置及其默认属性，默认使用production
    cp $php_dir/php.ini-* /usr/local/php/etc
    cp /usr/local/php/etc/php.ini-production /usr/local/php/etc/php.ini

    # 修改fpm相关配置
    cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
    cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf
    sed -i "s/nobody/www-data/g" /usr/local/php/etc/php-fpm.d/www.conf
}