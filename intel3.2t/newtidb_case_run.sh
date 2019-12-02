#!/bin/bash

cfg_file=sysbench-cfg/benchmark.cfg
sh 1_prep_dev.sh ${cfg_file}
sh 2_initdb.sh ${cfg_file} 
sh stop.sh ${cfg_file}

source ${cfg_file}
chown -R tcn:tcn ${mnt_point_data} 

## default setting compressed-prepared data
pushd ../lib/
sh extractlz4.sh /share2/dbset_bak/tidb_used/default_setting_load447GB/intel3.2/tidb-v4.0.0-alpha/tikv_data/db ${app_datadir_tikv}/db/
popd

## nocompressed-prepared data
#cp -r /opt/data/vanda/nocompress_databak/intel3.2t/tidb-v4.0.0-alpha ${mnt_point_data}

cp tidb-cfg/last_tikv.toml ${app_datadir_tikv} 

sh start.sh ${cfg_file} 
sh 3_run.sh ${cfg_file} 
