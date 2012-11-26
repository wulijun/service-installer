#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
tar -xzvf $MYSQL_FILE.tar.gz
cd $MYSQL_FILE
make clean
./configure \
--prefix=$INSTALL_MYSQL_PATH  \
--with-extra-charsets=all \
--with-charset=utf8 \
--enable-local-infile \
--with-unix-socket-path=$INSTALL_MYSQL_PATH"/mysql.sock"  \
--with-tcp-port=$MYSQL_PORT \
--with-plugins=max-no-ndb \
--with-mysqld-user=$CUR_USER

make
make install
cd ..
rm -rf $MYSQL_FILE

$INSTALL_MYSQL_PATH/bin/mysql_install_db --basedir=$INSTALL_MYSQL_PATH --datadir=$INSTALL_MYSQL_PATH/var --ldata=$INSTALL_MYSQL_PATH/var
cp $INSTALL_MYSQL_PATH/share/mysql/my-huge.cnf $INSTALL_MYSQL_PATH/my.cnf
cp $SRC_ROOT_PATH/my.cnf.* $INSTALL_MYSQL_PATH/
$INSTALL_MYSQL_PATH/bin/mysqld_safe --defaults-file=$INSTALL_MYSQL_PATH/my.cnf --ledir=$INSTALL_MYSQL_PATH/libexec &
cd $INSTALL_MYSQL_PATH && ./bin/mysql_secure_installation

cd $ROOT_PATH
