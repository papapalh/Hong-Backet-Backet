# Hong-Backet-Backet
~~~
    目的是做一套自己的开发环境，同时可以练习下 shell.
        想做个全家桶的东西，可以把我自己的环境包进去.
	    so.就叫 红桶桶 好了.
~~~
## 环境配置
目前支持的环境为： 
    ubuntu-16.04 x64
		
## 简单使用
~~~
git clone https://github.com/papapalh/Hong-Backet-Backet.git

cd Hong-Backet-Backet

/bin/bash Backet.sh
~~~


## 具体实现
~~~
目前实现自动编译安装 php-7.2.9 版本(可在Global.sh 中指定版本)
    1. 安装根目录为 /usr/local/php
    2. php.ini 可通过 php -i | grep 'php.ini' 查看
    3. 扩展支持 mbstring openssl
~~~

## 之后计划
~~~
    会逐步增加 其余的 自动化部署
~~~
 
## 目录结构

~~~
Hong-Back-Back 主目录
├─Global.sh            全局变量
│
├─Backet.sh            主要执行文件
│
├─System.sh            服务器系统配置函数
│
├─php                  
│  ├─Php.sh            php编译安装目录
│  └─Extend.sh         php扩展安装目录
│
├─README.md            吹牛bi 文件
~~~

## 总结
~~
  欢迎指教
~~
