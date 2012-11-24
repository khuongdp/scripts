#!/bin/bash


/usr/bin/expect << EOD
spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no webtest01 "cd /home/ami; ls -la; /bin/bash -i"
expect "password"
send "eqpHH/G3\n"
EOD
echo "you're out"
