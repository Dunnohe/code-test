#!/usr/bin/env bash

#!/bin/bash
function checkstatus() {
	wait_second=$1;
	status_code=$2;
	checkurl=$3;
	k=1;

	#echo "$wait_second";
	#echo "$status_code";
	#echo "$checkurl"

	if [ $wait_second -le 0 ]
	then
		echo "[check status exec error] wait_second 不合法,发布结束";
		return ;
	else
		echo "[check status exec success] wait_second: $wait_second";
	fi

	for k in $(seq 1 $wait_second)
	do
	    #if [ $status_code == $http_status_code ]
	    #if [ $k -ge 5 ]
        sleep 1
        http_status_code=`curl -I -m 1 -o /dev/null -s -w %{http_code} http://127.0.0.1:8080/actuator/health`
	    if [ $status_code == $http_status_code ]
        then
            echo "[check status exec success] 检查成功, $checkurl 返回code为: $http_status_code ,与$status_code 一致~~~"
            return 1
        else
            rest_second=`expr $wait_second - $k`
            echo "[check status exec error] 检查失败, $checkurl 返回code为:$http_status_code,与 $status_code 不一致!正在重试,剩余重试次数:{$rest_second}"
            if [ $k == $wait_second ]
            then
                return 2
            fi
        fi
	done

}

exec_dir=$1;
app_name=$2;


echo "[关闭应用]应用名:$app_name";
wait_second=180;
check_status_suc=1
check_status_fail=2
close_status=000;
start_status=200

curl -X POST http://127.0.0.1:8080/actuator/shutdown

checkstatus $wait_second $close_status http://127.0.0.1:8080/actuator/health

flag=$?
if [ $flag == $check_status_suc ]
then
    echo "[关闭应用]应用关闭成功!应用名:$app_name"
else
    echo "[关闭应用]应用关闭失败!程序退出!请人工部署检查!应用名:$app_name"
    exit 0
fi

echo "[重启应用]重启应用准备中,应用名:$app_name";
#cd /Users/lianghe/aliyuncode/yxuniverse/yxuniverse-operation/target
cd $exec_dir

nohup ./$app_name.jar >> $exec_dir/startlog.log &

checkstatus $wait_second $start_status http://127.0.0.1:8080/actuator/health
flag=$?
if [ $flag == $check_status_suc ]
then
    echo "[重启应用]重启应用准备中,重启成功,应用名:$app_name,本次启动日志在:$exec_dir/startlog.log";
else
    echo "[重启应用]重启应用准备中,重启失败!程序退出!请检查!应用名:$app_name,本次启动日志在:$exec_dir/startlog.log";
    exit 0
fi

#sh 4_app_restart.sh /Users/lianghe/aliyuncode/yxuniverse/yxuniverse-operation/target yxuniverse-operation