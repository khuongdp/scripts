#!/bin/bash
HOST='ftp.oftp2.test.asysdev.com'
USER='oftp2_test'
PASSWD='4Gt5h8fd'

ftp -n -v $HOST << EOT
ascii
user $USER $PASSWD
prompt #interactive mode
mkdir testing
cd testing
put testfile.txt
bye
EOT
sleep 12
