#!/bin/env python

# Documentation about ElementTree http://docs.python.org/library/xml.etree.elementtree.html

import sys
import xml.etree.ElementTree as ET

filename = sys.argv[1]
tree = ET.ElementTree(file=filename)
for element in tree.findall('myelement'):
	print element
	# change element value
	#element.text = str(int(element.text) + 1)
	# add new attribute to element
	#element.attrib['newkey'] = 'newvalue' 	
	# delete attribute from element
	#del element.attrib['newkey']
	# edit attribute value of the element
	#element.set('att', 'vvvv')
	# append a new element
	#element.append(ET.Element('testing1'))
# write the result
tree.write(filename)
