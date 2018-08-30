#!bin/bash
#PHP扩展安装

PhpExtendInatall()
{
    # 安装 mbstring 扩展
    PhpExtendInatallFunction mbstring

    # 安装 openssl 扩展
    PhpExtendInatallFunction openssl
}

# 扩展安装通用方法
PhpExtendInatallFunction()
{
    # 如果已经安装扩展，则跳过
    if [[ $(php -m | grep $1) ]]; then
        return
    fi

    # 判断是否有原生扩展包
    if [[ ! -d $php_dir/ext/$1 ]]; then
        echo "[PHP扩展安装][$1] 扩展安装出现出题，请重试." >> $log
        return
    fi

    # 避免某些扩展的特殊机制导致安装失败
    if [[ ! -f $php_dir/ext/$1/config.m4 ]]; then
        if [[ -f $php_dir/ext/$1/config0.m4 ]]; then
            mv $php_dir/ext/$1/config0.m4 $php_dir/ext/$1/config.m4
        fi
    fi

    # 安装依赖
    phpize $php_dir/ext/$1
    $php_dir/ext/$1/configure
    make&&make install

    # 修改php/ini
    sed -i "s/;extension=$1/extension=$1/g" /usr/local/php/etc/php.ini
}