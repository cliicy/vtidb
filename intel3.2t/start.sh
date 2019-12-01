#!/bin/bash

cfg_file=$1
if [ "$1" = "" ]; then echo -e "Usage:\n\t2_initdb.sh cfg_file"; exit 1; fi
if [ ! -e ${cfg_file} ]; then echo "can't find configuration file [${cfg_file}]", exit 2; fi
source ${cfg_file}

##start pd-server
${app_basedir}/bin/pd-server --data-dir=${app_datadir_pd} --log-file=${app_pdlog} &
sleep 5

##start tikv
${app_basedir}/bin/tikv-server --pd=${host}:${port} --store=${app_datadir_tikv} --log-file=${app_tikvlog} -C ${tidb_cfg}  &
sleep 5

##start tidb
${app_basedir}/bin/tidb-server --store=tikv --path=${host}:${port} --log-file=${app_tidblog} &
sleep 5

#for i in {1..1200};
#do
#    cat ${app_dbglog} | grep "database system is ready to accept connections"
#    if [ $? -eq 0 ]; then echo started; sleep 10; break; fi
#    echo "waiting for postgresql to start"
#    sleep 3
#done

#create test database/user for sysbench to benchmark
client_cmd="${cli_access} -h ${host} -P ${cli_port} -u ${cli_usr} -D ${cli_db}"
echo -e "create user '${user}'@'%' identified by 'tcn';" | ${client_cmd}
echo -e "GRANT ALL ON *.* TO '${user}'@'%';" | ${client_cmd}

echo -e "create database ${dbname}" | ${client_cmd} 
echo -e "set @@global.tidb_disable_txn_auto_retry = 0;" | ${client_cmd} 
echo -e "set @@global.tidb_retry_limit = 10;" | ${client_cmd} 
sleep 3

