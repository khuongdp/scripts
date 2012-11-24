#!/bin/bash

## Takes a heap dump of speficied JVM
APP2DUMP=$1
PID2DUMP=`ps ax|grep ${APP2DUMP}|grep -v "/bin/sh"|grep -v grep|grep -v java_heap_dump|awk '{print $1}'`
DUMP_FILE=heapdump_${APP2DUMP}.bin

echo "==============================================================================================="
echo "Deleting file /home/ami/${DUMP_FILE}"
rm -f /home/ami/${DUMP_FILE}
echo "Dumping heap of ${APP2DUMP} (PID: ${PID2DUMP}) into file /home/ami/${DUMP_FILE}"
sudo -u jboss /usr/java/default/bin/jmap -dump:format=b,file=/home/ami/${DUMP_FILE} ${PID2DUMP}
wget --spider http://auction-int.prod.autorola.com:8080/changedumppermissions.jsp
