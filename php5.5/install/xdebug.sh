#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar -zxvf xdebug-2.1.1.tgz 
cd xdebug-2.1.1
$INSTALL_PHP_PATH/bin/phpize
./configure --enable-xdebug --with-php-config=$INSTALL_PHP_PATH/bin/php-config  
make

cp modules/xdebug.so $INSTALL_PHP_PATH/lib/exts/
cd ../
#rm -rf xdebug-2.1.1

#edit php.ini set zend_extension=$INSTALL_PHP_PATH/lib/exts/xdebug.so
#$INSTALL_PHP_PATH/sbin/php-fpm/restart
