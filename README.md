# vtidb
sudo yum install mysql
wget http://download.pingcap.org/tidb-latest-linux-amd64.tar.gz
tar -zvxf tidb-latest-linux-amd64.tar.gz
pushd /usr/local/
sudo ln -s /opt/app/tidb-latest-linux-amd64 tidb

mysql -h 127.0.0.1 -P 4000 -u root -D test
set global tidb_disable_txn_auto_retry = off;

manaully move the code of creating second index from end to front of creating sbtest%d tables 


