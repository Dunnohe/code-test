#!/usr/bin/env bash


install_dir="/usr/local/heliang05_test";
maven_download_url="http://mirror.bit.edu.cn/apache/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz"
maven_ln_name="/usr/local/maven3";


echo "==>准备开始安装maven";
echo "==>下载地址:$maven_download_url";
echo "==>开始下载maven";
#wget ${maven_download_url};
echo "==>下载完毕,将包移动到/usr/local下面"

echo "==>开始解压maven";

curr_dir=`pwd 2>&1`;

if [ ${curr_dir} != ${install_dir} ]
then
    mv apache-maven-3.5.3-bin.tar.gz /usr/local
    cd /usr/local
fi

tar -zxvf apache-maven-3.5.3-bin.tar.gz  > /dev/null
echo "==>解压完毕,开始建立软连接";
ln -s ${install_dir}/apache-maven-3.5.3 ${maven_ln_name}
echo "==>建立环境变量";
export MAVEN_HOME=${maven_ln_name}
export PATH=$MAVEN_HOME/bin:$PATH
echo "==>安装完毕";
