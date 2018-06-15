#!/usr/bin/env bash

install_dir="/usr/local/heliang05_test";
jdk_1_8_down_url="http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz"
jdk_ln_name="/usr/local/jdk8";


echo "==>准备开始安装jdk";
echo "==>下载地址:$jdk_1_8_down_url";
echo "==>开始下载jdk";
#wget --no-cookie --header "Cookie: oraclelicense=accept-securebackup-cookie" ${jdk_1_8_down_url};
echo "==>下载完毕,将包移动到/usr/local下面"

echo "==>开始解压jdk";

curr_dir=`pwd 2>&1`;

if [ ${curr_dir} != ${install_dir} ]
then
    mv jdk-8u171-linux-x64.tar.gz /usr/local
    cd /usr/local
fi

tar -zxvf jdk-8u171-linux-x64.tar.gz  > /dev/null
echo "==>解压完毕,开始建立软连接";
ln -s ${install_dir}/jdk1.8.0_171 ${jdk_ln_name}
echo "==>建立环境变量";
export JAVA_HOME=${jdk_ln_name}
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
echo "==>安装完毕";
