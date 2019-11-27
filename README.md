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
