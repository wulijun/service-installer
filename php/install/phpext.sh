#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
EXTNAME=APC-3.1.9
tar -xzvf $EXTNAME.tgz
cd $EXTNAME
$INSTALL_PHP_PATH/bin/phpize
./configure --enable-apc --enable-apc-spinlocks --disable-apc-pthreadmutex --with-php-config=$INSTALL_PHP_PATH/bin/php-config  
make
cp modules/*.so $INSTALL_PHP_PATH/lib/exts/
cd ../
rm -rf $EXTNAME

EXTNAME=memcache-2.2.6
tar -xzvf $EXTNAME.tgz
cd $EXTNAME
$INSTALL_PHP_PATH/bin/phpize
./configure --with-php-config=$INSTALL_PHP_PATH/bin/php-config                
make
cp modules/*.so $INSTALL_PHP_PATH/lib/exts/
cd ../
rm -rf $EXTNAME

EXTNAME=mongo-1.2.9
tar -xzvf $EXTNAME.tgz
cd $EXTNAME
$INSTALL_PHP_PATH/bin/phpize
./configure --with-php-config=$INSTALL_PHP_PATH/bin/php-config
make
cp modules/*.so $INSTALL_PHP_PATH/lib/exts/
cd ../
rm -rf $EXTNAME

EXTNAME=solr-1.0.2
tar -xzvf $EXTNAME.tgz
cd $EXTNAME
$INSTALL_PHP_PATH/bin/phpize
./configure --with-php-config=$INSTALL_PHP_PATH/bin/php-config
make
cp modules/*.so $INSTALL_PHP_PATH/lib/exts/
cd ../
rm -rf $EXTNAME

EXTNAME=thrift_protocol-0.8.0
tar -xzvf $EXTNAME.tar.gz
cd $EXTNAME
$INSTALL_PHP_PATH/bin/phpize
./configure --with-php-config=$INSTALL_PHP_PATH/bin/php-config
make
cp modules/*.so $INSTALL_PHP_PATH/lib/exts/
cd ../
rm -rf $EXTNAME

EXTNAME=phpredis-2.1.3
tar -xzvf $EXTNAME.tar.gz
cd $EXTNAME
$INSTALL_PHP_PATH/bin/phpize
./configure --with-php-config=$INSTALL_PHP_PATH/bin/php-config
make
cp modules/*.so $INSTALL_PHP_PATH/lib/exts/
cd ../
rm -rf $EXTNAME
