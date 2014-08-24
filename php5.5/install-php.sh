#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
PHPNAME=php-5.5.16
tar -xzvf $PHPNAME.tar.gz
cd $PHPNAME
make clean
PATH=$PATH:$LIB_PATH/bin
./configure \
--prefix=$INSTALL_PHP_PATH  \
	--with-jpeg-dir=$LIB_PATH  \
	--with-png-dir=$LIB_PATH \
	--with-freetype-dir=$LIB_PATH \
	--with-xpm-dir=/usr/lib64 \
	--with-zlib-dir=$LIB_PATH \
	--with-gd=$LIB_PATH \
	--with-mcrypt=$LIB_PATH \
	--with-mysql=mysqlnd \
	--with-pdo-mysql=mysqlnd \
	--with-mysqli=mysqlnd \
	--with-gettext \
	--with-iconv \
	--enable-mbstring \
	--with-xmlrpc \
	--with-openssl \
    --enable-dom \
    --enable-opcache \
	--enable-sockets \
	--enable-ftp \
	--enable-shmop \
	--enable-exif \
	--with-config-file-path=$PHP_CONF_PATH \
	--enable-xml \
	--with-libxml-dir=$LIB_PATH \
	--with-curl=$LIB_PATH \
	--enable-fpm \
	--without-pear \
	--without-sqlite3 \
	--without-pdo-sqlite \
	--enable-pcntl \
	--enable-bcmath
make && make install
cp ./sapi/fpm/init.d.php-fpm $INSTALL_PHP_PATH/sbin/
chmod +x $INSTALL_PHP_PATH/sbin/init.d.php-fpm
cp $SRC_ROOT_PATH/rotate_log.sh $INSTALL_PHP_PATH/sbin/
chmod +x $INSTALL_PHP_PATH/sbin/rotate_log.sh
cd .. && rm -rf $PHPNAME

mkdir -p $INSTALL_PHP_PATH/data
cp -r $DATA_ROOT_PATH/* $INSTALL_PHP_PATH/data/

mkdir -p $INSTALL_PHP_PATH/lib/php-libs
cp -r $SRC_ROOT_PATH/php-exts/* $INSTALL_PHP_PATH/lib/php/extensions/no-debug-non-zts-20121212
cp -r $SRC_ROOT_PATH/php-libs/* $INSTALL_PHP_PATH/lib/php-libs

mkdir -p $INSTALL_PHP_PATH/etc
cp -r $CONF_ROOT_PATH/* $INSTALL_PHP_PATH/etc/
#mv $INSTALL_PHP_PATH/etc/php.ini $PHP_CONF_PATH
sed -e "s:/home/worker/php5:$INSTALL_PHP_PATH:g" -i $INSTALL_PHP_PATH/etc/php-fpm.conf
sed -e "s:/home/worker/php5:$INSTALL_PHP_PATH:g" -i $INSTALL_PHP_PATH/etc/pool.d/www.php.pool.conf
sed -e "s:{CUR_USER}:$CUR_USER:g" -i $INSTALL_PHP_PATH/etc/pool.d/www.php.pool.conf
sed -e "s:/home/worker/php5:$INSTALL_PHP_PATH:g" -i $PHP_CONF_PATH/php.ini

#mkdir -p $HOME_PATH/app-php/webroot
#cp -r $SRC_ROOT_PATH/../webroot/* $HOME_PATH/app-php/webroot/
cd $ROOT_PATH 

sh ./install/phpext.sh
