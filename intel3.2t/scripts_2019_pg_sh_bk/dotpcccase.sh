#! /bin/bash

sleep 2  
#sh tpcc_run.sh sysbench-cfg/benchmark.cfg
sh ./1_prep_dev.sh sysbench-cfg/benchmark.cfg
sh ./2_initdb.sh sysbench-cfg/benchmark.cfg
sh ./run_tpcc.sh sysbench-cfg/benchmark.cfg

