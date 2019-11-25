#!/bin/bash

kill -9 `ps aux | grep -v grep | grep -e bin/pd-server | cut -c 10-15`
kill -9 `ps aux | grep -v grep | grep -e bin/tikv-server | cut -c 10-15`
kill -9 `ps aux | grep -v grep | grep -e bin/tidb-server | cut -c 10-15`

serverlist="pd-server tikv-server tidb-server"
for tis in ${serverlist}
do
    for i in {1..100};
    do
        ps aux | grep -v grep | grep -e bin/${tis}
        if [ $? -ne 0 ]; then echo stopped; sleep 3; break; fi
        echo "waiting for ${tis} to exit"
        sleep 3
    done
done
