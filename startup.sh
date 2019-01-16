#!/bin/bash

# Update this as the file changes.  Please be sure to agree to the EULA
BEDROCK_DOWNLOAD_ZIP=https://minecraft.azureedge.net/bin-linux/bedrock-server-1.8.0.24.zip
ZIPFILE=$(basename $BEDROCK_DOWNLOAD_ZIP)

cd /home/bedrock/bedrock_server

if [ ! -f $ZIPFILE ]; then
   echo "Downloading file"

   # Download and if successful, unzip (don't allow overwrites)
   curl --fail -O $BEDROCK_DOWNLOAD_ZIP && unzip -n -q $ZIPFILE

   # keep a copy of the server.properties file so we can restore defaults.
   cp server.properties server.properties.defaults
fi

function copy_config() {
   filename=$1

   # if the file exists in the config folder then copy the config
   if [ -f config/$filename ]; then
      cp config/$filename $filename

   # if there is a default config then copy that to both locations
   elif [ -f $filename.defaults ]; then
      cp $filename.defaults $filename
      cp $filename.defaults config/$filename
   fi
}

copy_config server.properties
copy_config ops.json
copy_config whitelist.json
copy_config permissions.json

if [ -f "bedrock_server" ]; then
   echo "Executing server"
   LD_LIBRARY_PATH=. ./bedrock_server
else
   echo "Server software not downloaded or unpacked!"
fi
