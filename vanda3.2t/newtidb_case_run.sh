#!/bin/bash

cfg_file=sysbench-cfg/benchmark.cfg
sh 1_prep_dev.sh ${cfg_file}
sh 2_initdb.sh ${cfg_file} 
sh stop.sh ${cfg_file}
chown -R tcn:tcn ${mnt_point_data} 
pushd ../lib/
sh extractlz4.sh /share2/dbset_bak/tidb_used/dbset400GB/vanda3.2/tikv_data_db_sst_bk/ ${app_datadir_tikv}/db/
popd
cp tidb-cfg/last_tikv.toml ${app_datadir_tikv} 
sh start.sh ${cfg_file} 
sh 3_run.sh ${cfg_file} 
