# vtidb
sudo yum install mysql
wget http://download.pingcap.org/tidb-latest-linux-amd64.tar.gz
tar -zvxf tidb-latest-linux-amd64.tar.gz
pushd /usr/local/
sudo ln -s /opt/app/tidb-latest-linux-amd64 tidb

##
##[FATAL] [server.rs:468] ["the maximum number of open file descriptors is too small, got 1024, expect greater or equal to 82920"
ulimit -a
http://www.tocker.ca/this-blog-now-powered-by-wordpress-tidb.html
reboot
mysql -h 127.0.0.1 -P 4000 -u root -D test
set global tidb_disable_txn_auto_retry = off;

manaully move the code of creating second index from end to front of creating sbtest%d tables, but it seems doesn't fix the problem of loading data to tidb will take very long time: like loading 400GB ,time consuming will be 12hours+ 
