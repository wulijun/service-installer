#!/bin/sh

. ./conf.sh

cd $SRC_ROOT_PATH

EXTNAME=djutil-1.0.2
tar -xzvf $EXTNAME.tar.gz
cd $EXTNAME
$INSTALL_PHP_PATH/bin/phpize
./configure --with-php-config=$INSTALL_PHP_PATH/bin/php-config
make && make install
cd ../
rm -rf $EXTNAME

EXTNAME=mongo-1.6.11
tar -xzvf $EXTNAME.tgz
cd $EXTNAME
$INSTALL_PHP_PATH/bin/phpize
./configure --with-php-config=$INSTALL_PHP_PATH/bin/php-config
make && make install
cd ../
rm -rf $EXTNAME

# apt-get install libmagickwand-dev libmagickcore-dev
# yum install ImageMagick-devel
#EXTNAME=imagick-3.3.0RC2
#tar -xzvf $EXTNAME.tgz
#cd $EXTNAME
#$INSTALL_PHP_PATH/bin/phpize
#./configure --with-php-config=$INSTALL_PHP_PATH/bin/php-config
#make && make install
#cd ../
#rm -rf $EXTNAME
