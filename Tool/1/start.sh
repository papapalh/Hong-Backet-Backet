#!bin/bash

# 定义目录
toolFunPath='/tmp/Hong-Backet-backet'

# 验证目录是否存在
if [[ ! -d $toolFunPath ]]; then
    mkdir -p $toolFunPath
fi

# 验证文件是否存在
if [[ -f $toolFunPath/toolclass.php ]]; then

    echo '已经存在，是否覆盖(yes/no)？'

    # 选择类型
    read -p "Place choice: " status

    if [[ status=='yes' ]]; then
        rm $toolFunPath/toolclass.php
    else
        exit
    fi
fi

# 新建文件
touch $toolFunPath/toolclass.php

# 循环写入 .php 文件
for file in 'Tool/1/PhpToolClass/*.php'
do
    if test -f $file
    then
        cat $file >> $toolFunPath/toolclass.php
    fi
done

echo -e "\033[0;32mDone...\033[0m"
echo -e "\033[0;32m请在对应PHP脚本中加入:\033[0m"
echo -e "     require '$toolFunPath/toolclass.php';"
echo -e "\n"

