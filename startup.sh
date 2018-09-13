#!/bin/sh

ZIPFILE=$(basename $BEDROCK_DOWNLOAD_ZIP)

cd /home/bedrock/bedrock_server

if [ ! -f $ZIPFILE ]; then
   echo "Downloading file"

   # Download and if successful, unzip (don't allow overwrites)
   curl --fail -O $BEDROCK_DOWNLOAD_ZIP && unzip -n $ZIPFILE
fi

if [ -f "bedrock_server" ]; then
   echo "Executing server"
   LD_LIBRARY_PATH=. ./bedrock_server
else
   echo "Server software not downloaded or unpacked!"
fi
