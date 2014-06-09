#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH

#EXTNAME=djutil-1.0.1
#tar -xzvf $EXTNAME.tar.gz
#cd $EXTNAME
#$INSTALL_PHP_PATH/bin/phpize
#./configure --with-php-config=$INSTALL_PHP_PATH/bin/php-config
#make
#cp modules/*.so $INSTALL_PHP_PATH/lib/php/extensions/no-debug-non-zts-20121212
#cd ../
#rm -rf $EXTNAME

EXTNAME=phpredis-2.2.5
tar -xzvf $EXTNAME.tar.gz
cd $EXTNAME
$INSTALL_PHP_PATH/bin/phpize
./configure --with-php-config=$INSTALL_PHP_PATH/bin/php-config
make
cp modules/*.so $INSTALL_PHP_PATH/lib/php/extensions/no-debug-non-zts-20121212
cd ../
rm -rf $EXTNAME
