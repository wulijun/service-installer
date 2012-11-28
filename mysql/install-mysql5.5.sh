#!/bin/sh

source ./conf.sh

cd $SRC_ROOT_PATH
rm -rf $MYSQL_FILE
tar -xzvf $MYSQL_FILE.tar.gz
cd $MYSQL_FILE

cmake . -DCMAKE_INSTALL_PREFIX=$INSTALL_MYSQL_PATH  \
-DDEFAULT_CHARSET=utf8  -DDEFAULT_COLLATION=utf8_general_ci -DEXTRA_CHARSETS=all  \
-DWITH_SSL=system -DWITH_EMBEDDED_SERVER=1 -DENABLED_LOCAL_INFILE=1 \
-DWITH_MYISAM_STORAGE_ENGINE=1 -DMYSQL_USER=$CUR_USER \
-DMYSQL_UNIX_ADDR=$INSTALL_MYSQL_PATH"/mysql.sock"  \
-DMYSQL_TCP_PORT=$MYSQL_PORT

make
make install
cd ..

$INSTALL_MYSQL_PATH/bin/mysql_install_db --basedir=$INSTALL_MYSQL_PATH --datadir=$INSTALL_MYSQL_PATH/var --ldata=$INSTALL_MYSQL_PATH/var
cp $INSTALL_MYSQL_PATH/share/mysql/my-huge.cnf $INSTALL_MYSQL_PATH/my.cnf
cp $SRC_ROOT_PATH/my.cnf.* $INSTALL_MYSQL_PATH/
$INSTALL_MYSQL_PATH/bin/mysqld_safe --defaults-file=$INSTALL_MYSQL_PATH/my.cnf --ledir=$INSTALL_MYSQL_PATH/libexec &
cd $INSTALL_MYSQL_PATH && ./bin/mysql_secure_installation

cd $ROOT_PATH