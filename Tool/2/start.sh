#!bin/bash

# 定义目录
mkdir -p /tmp/lihong

apt-get update
apt-get install -y git gcc make mysql-server

git clone https://github.com/Percona-Lab/tpcc-mysql.git /tmp/lihong/tpcc-mysql


echo -e "\033[0;32mDone...\033[0m"
echo -e "\033[0;32m请在 /tmp/lihong/tpcc-mysql/src 下执行 make \033[0m"
echo -e "\n"

