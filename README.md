# vtidb
sudo yum install mysql
wget http://download.pingcap.org/tidb-latest-linux-amd64.tar.gz
tar -zvxf tidb-latest-linux-amd64.tar.gz
pushd /usr/local/
sudo ln -s /opt/app/tidb-latest-linux-amd64 tidb
