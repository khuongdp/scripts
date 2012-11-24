#!/bin/env python

from ftplib import FTP
import sys

def main():
	HOST='ftp.oftp2.dev04.asysdev.com'
	USER='oftp2_dev04'
	PASSWD='dev04'

	outbox_pending='outbox/pending'
	outbox_old='outbox/old'
	
	partner=sys.argv[1]

	# Check if only 1 arguments (commandline) or from Mendelson gui client (--)
	if len(sys.argv) == 2 or sys.argv[2] == '--':
		print "Testing - filename is not set"
		return

	filename=sys.argv[2]

	from_filename=partner + "/" + outbox_pending + "/" + filename
	to_filename=partner + "/" + outbox_old + "/" + filename

	ftp = FTP(HOST)
	ftp.login(USER, PASSWD)

	ftp.rename(from_filename, to_filename)
	print filename + " is moved successful"

	ftp.close()

if __name__ == "__main__":
    main()
