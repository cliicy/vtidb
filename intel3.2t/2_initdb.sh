#!/bin/bash

cfg_file=$1
if [ "$1" = "" ]; then echo -e "Usage:\n\t2_initdb.sh cfg_file"; exit 1; fi
if [ ! -e ${cfg_file} ]; then echo "can't find configuration file [${cfg_file}]", exit 2; fi
source ${cfg_file}

./stop.sh ${cfg_file}

if [ "${app_datadir_pd}" != "" ] && [ ! -e ${app_datadir_pd} ];
then
        sudo mkdir -p ${app_datadir_pd};
fi

if [ "${app_datadir_tikv}" != "" ] && [ ! -e ${app_datadir_tikv} ];
then
        sudo mkdir -p ${app_datadir_tikv};
fi

if [ "${app_datadir_tidb}" != "" ] && [ ! -e ${app_datadir_tidb} ];
then
        sudo mkdir -p ${app_datadir_tidb};
fi

if [ "${app_logs}" != "" ] && [ ! -e ${app_logs} ];
then
        sudo mkdir -p ${app_logs};
fi

sudo chown -R `whoami`:`whoami` ${app_datadir_root}

if [ "${mnt_point_data}" != "" ] && [ ! -e ${mnt_point_data} ];
then
	rm -rf ${mnt_point_data}/*
fi

./start.sh ${cfg_file}

