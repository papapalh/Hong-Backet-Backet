#!bin/bash

# 定义类型
lists=(
	[0]='编译安装PHP' 
	[1]='生成PHP工具函数' 
	[2]='安装MySQL[tpcc-mysql] 压力测试工具'	
	[3]='构建docker环境'
)

echo -e "\033[0;32mchoice : \033[0m"

for (( i = 0; i < ${#lists[@]}; i++ )); do
	echo -e "\033[0;32m    ${i}:${lists[$i]} \033[0m"
done

# 选择类型
read -p "Place choice: " tool

# 验证是否有该文件
if [[ ! -f "Tool/${tool}/start.sh" ]]; then
	echo -e "\033[31mChoice Error \033[0m"
	exit
fi

# 执行对应脚本
/bin/bash Tool/${tool}/start.sh

