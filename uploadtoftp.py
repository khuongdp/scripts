#!/bin/env python

from ftplib import FTP
import sys
import re
import os

def mkfolder(ftp, path):
	filelist = []
	ftp.retrlines('LIST',filelist.append)  
	for f in filelist:
		if re.search("^d.*"+path+"$", f):
			return 1
	return 0

def main():
	HOST='ftp.oftp2.dev04.asysdev.com'
	USER='oftp2_dev04'
	PASSWD='dev04'

	upload_path='/inbox/pending'

	partner=sys.argv[1]
	path=sys.argv[2]
	filename=sys.argv[3]

	full_filename=path + "/" + filename
	full_upload_path=partner + "/" + upload_path

	full_upload_pathnames=full_upload_path.split("/")
	# Remove empty element in the list
	full_upload_pathnames=filter(None, full_upload_pathnames)

	f = None
	ftp = None

	try:
		ftp = FTP(HOST)
		ftp.login(USER, PASSWD)

		for full_upload_pathname in full_upload_pathnames:
			if not mkfolder(ftp, full_upload_pathname):
				print "Creating " + full_upload_pathname + " folder"
				ftp.mkd(full_upload_pathname)
			ftp.cwd(full_upload_pathname)

		f = open(full_filename,'rb')
		ftp.storbinary('STOR ' + filename, f)
		os.remove(full_filename)
		print filename + " is sent successful"
	finally:
		if f is not None:
			f.close()       
		if ftp is not None:
			ftp.close()

if __name__ == "__main__":
    main()
