#!/bin/sh
#user home path
CUR_USER=$USER
HOME_PATH=/home/$CUR_USER

INSTALL_MYSQL_PATH=$HOME_PATH"/mysql5"
MYSQL_PORT=3306

#lib install path
LIB_PATH="$HOME_PATH/lib"

##################################################
#DONT MODIFY
##################################################
ROOT_PATH=`pwd`
SRC_ROOT_PATH=$ROOT_PATH"/src"