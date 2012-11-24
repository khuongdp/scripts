# Arguments inputfile outputfile searchregex replacement
import sys
import re
o = open(sys.argv[2],"w")
data = open(sys.argv[1]).read()
o.write( re.sub(sys.argv[3],sys.argv[4],data)  )
o.close()
