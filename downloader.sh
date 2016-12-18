#!/bin/bash

dirName=`dirname $0`
url=${1:-""}

if [ -e "$url" ]; then echo "url can not be emtpy!"; return 1; fi

fileName=$(basename $url)
if [ ! -e "$fileName" ]
then
  echo "Download $fileName to $dirName/"
  wget $url -O $dirName/$fileName
else
  echo "$fileName already exists."
fi

