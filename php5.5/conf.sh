#!/bin/sh
#user home path
CUR_USER=$USER
HOME_PATH=/usr/local

#PHP5 install path
INSTALL_PHP_PATH=$HOME_PATH"/php5.6"

#lib install path
LIB_PATH="/lib64/php5.6"

##################################################
#DONT MODIFY
##################################################
export PATH=$LIB_PATH/bin:$PATH
ROOT_PATH=`pwd`
SRC_ROOT_PATH=$ROOT_PATH"/src"
DATA_ROOT_PATH=$ROOT_PATH"/data"
CONF_ROOT_PATH=$ROOT_PATH"/conf"
PHP_CONF_PATH=$INSTALL_PHP_PATH/etc
