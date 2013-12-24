#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH

EXTNAME=djutil-1.0.0
tar -xzvf $EXTNAME.tgz
cd $EXTNAME
$INSTALL_PHP_PATH/bin/phpize
./configure --with-php-config=$INSTALL_PHP_PATH/bin/php-config                
make
cp modules/*.so $INSTALL_PHP_PATH/lib/exts/
cd ../
rm -rf $EXTNAME

EXTNAME=phpredis-2.2.4
tar -xzvf $EXTNAME.tar.gz
cd $EXTNAME
$INSTALL_PHP_PATH/bin/phpize
./configure --with-php-config=$INSTALL_PHP_PATH/bin/php-config
make
cp modules/*.so $INSTALL_PHP_PATH/lib/exts/
cd ../
rm -rf $EXTNAME
