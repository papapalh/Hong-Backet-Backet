#!bin/bash

# 定义目录
mkdir -p /tmp/lihong
cd /tmp/lihong

apt-get update
apt-get install -y git gcc make 

git clone https://github.com/Percona-Lab/tpcc-mysql.git /tmp/lihong/tpcc-mysql

cd /tmp/lihong/tpcc-mysql/src&make

echo -e "\033[0;32m 进入 /tmp/lihong/tpcc-mysql/src 执行 make 即可\033[0m"
echo -e "\n"