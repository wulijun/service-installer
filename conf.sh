#!/bin/sh
#用户的起始目录，后面的程序和依赖库都会以它为开始路径，线上机器请保持默认值，线下安装请修改为当前用户
#的目录
HOME_PATH=/home/$USER

#nginx的安装路径，一般不用修改
INSTALL_PATH="/usr/local/nginx"

#依赖库的安装路径，一般不用修改
LIB_PATH=$INSTALL_PATH"/lib"

##################################################
#不要修改下面这些变量
##################################################
ROOT_PATH=`pwd`
SRC_ROOT_PATH=$ROOT_PATH"/src"
