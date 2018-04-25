#!/bin/bash

# toolbox 设置virtualBox共享文件夹路径d盘，共享文件夹名称为d

fold_path=$(cd `dirname $0`; pwd)
#echo $fold_path

if [ ! -d "$fold_path/mysql" ]; then
	mkdir $fold_path/mysql
fi

is_win=$(echo $OS | grep -i "win")

docker_run="docker run --name mysql --restart always -v $fold_path/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=mysql -p 3306:3306 -d mysql:5.6"

docker_info=`docker info 2>&1`
# 判断是否在docker环境下
if [ $? -ne 0 ]; then
	docker-machine start
	docker-machine ssh default "$docker_run"
else
	$docker_run
fi