#!bin/bash

source Global.sh      # 全局变量
source System.sh      # 系统初始化
source php/Php.sh     # PHP 编译安装
source php/Extend.sh  # PHP 扩展编译安装

# 系统初始化
SystemInit

# php编译安装
PhpInstall

# php扩展安装
PhpExtendInatall