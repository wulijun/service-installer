#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
PHPNAME=php-5.5.7
tar -xzvf $PHPNAME.tar.gz
cd $PHPNAME
make clean
PATH=$PATH:$LIB_PATH/bin
./configure \
--prefix=$INSTALL_PHP_PATH  \
	--enable-dom \
	--enable-opcache \
	--with-jpeg-dir=$LIB_PATH  \
	--with-png-dir=$LIB_PATH \
	--with-gd=$LIB_PATH \
	--with-freetype-dir=$LIB_PATH \
	--with-zlib-dir=$LIB_PATH \
	--with-mcrypt=$LIB_PATH \
	--with-mysql=mysqlnd \
	--with-pdo-mysql=mysqlnd \
	--with-mysqli=mysqlnd \
	--with-gettext \
	--with-iconv \
	--enable-mbstring \
	--with-xmlrpc \
	--enable-safe-mode \
	--enable-sockets \
	--enable-ftp \
	--enable-shmop \
	--enable-exif \
	--with-config-file-path=$PHP_CONF_PATH \
	--enable-xml \
	--with-libxml-dir=$LIB_PATH \
	--with-pcre-dir=$LIB_PATH \
	--with-curl=$LIB_PATH \
	--with-curlwrappers \
	--enable-fpm \
	--without-pear \
	--without-sqlite \
	--without-sqlite3 \
	--without-pdo-sqlite \
	--enable-pcntl \
	--enable-bcmath
make && make install
cp ./sapi/fpm/init.d.php-fpm ./sapi/fpm/status.html $INSTALL_PHP_PATH/sbin/
chmod +x $INSTALL_PHP_PATH/sbin/init.d.php-fpm
cp $SRC_ROOT_PATH/rotate_log.sh $INSTALL_PHP_PATH/sbin/
chmod +x $INSTALL_PHP_PATH/sbin/rotate_log.sh
cd .. && rm -rf $PHPNAME

mkdir -p $INSTALL_PHP_PATH/data
cp -r $DATA_ROOT_PATH/* $INSTALL_PHP_PATH/data/

mkdir -p $INSTALL_PHP_PATH/lib/php-libs
mkdir -p $INSTALL_PHP_PATH/lib/exts
cp -r $SRC_ROOT_PATH/php-exts/* $INSTALL_PHP_PATH/lib/exts/
cp -r $SRC_ROOT_PATH/php-libs/* $INSTALL_PHP_PATH/lib/php-libs

mkdir -p $INSTALL_PHP_PATH/etc
cp -r $CONF_ROOT_PATH/* $INSTALL_PHP_PATH/etc/
mv $INSTALL_PHP_PATH/etc/php.ini $INSTALL_PHP_PATH/php.ini
sed -e "s:/home/worker/php5:$INSTALL_PHP_PATH:g" -i $INSTALL_PHP_PATH/etc/php-fpm.conf
sed -e "s:{CUR_USER}:$CUR_USER:g" -i $INSTALL_PHP_PATH/etc/php-fpm.conf
sed -e "s:/home/worker/php5:$INSTALL_PHP_PATH:g" -i $INSTALL_PHP_PATH/php.ini

#mkdir -p $HOME_PATH/app-php/webroot
#cp -r $SRC_ROOT_PATH/../webroot/* $HOME_PATH/app-php/webroot/
#cd $ROOT_PATH 
