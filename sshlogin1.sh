#!/usr/bin/expect -f
set password [lrange $argv 0 0]
spawn ssh webtest01 "cd /home/ami; touch deleteme; /bin/bash -i"
expect "?assword:*"
send -- "eqpHH/G3\r"
interact
