#!bin/bash

# 定义目录
mkdir -p /tmp/lihong
cd /tmp/lihong

apt-get update
apt-get install -y git gcc make 


echo -e "\033[0;32mDone...\033[0m"
echo -e "\033[0;32m请在对应PHP脚本中加入:\033[0m"
echo -e "     include '$toolFunPath/toolclass.php';"
echo -e "\n"

