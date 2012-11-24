#!/bin/bash

# 1.parameter version format x to x.x.x.x.n All versions below this version will be catch 
# 2.parameter starting directory

version=$1
dir=$2
results=`find $dir -regextype posix-extended -type d -regex '.*/[0-9]+(\.[0-9]+)*(-SNAPSHOT)?'`
for i in ${results}; do
  # get only the directory name	
  current_version=${i##*/}
  # remove the SNAPSHOT is exist
  current_version=${current_version%-SNAPSHOT}
  # if the sort command support it use 'sort -V' instead
  smallest_version=`echo -e "${current_version}\n${version}" | sort -bt. -k1,1 -k2,2n -k3,3n -k4,4n -k5,5n | head -n1`
  if [ $smallest_version = $current_version ]; then
    echo rm -rf $i
  fi
done
