#!/bin/sh

# check that there is a server.properties file in the data directory.
# otherwise when the volumes are created, server.properties will be
# a directory, not a file.
if [ ! -f ./data/server.properties ]; then
   # if the default file is missing, exit with error.
   if [ ! -f ./data/server.properties.default ]; then
      echo "Error data/server.properties does not exist and cannot create default since data/server.properties.default does not exist." 1>&2
      exit 1
   fi
   
   cp ./data/server.properties.default ./data/server.properties
fi

docker-compose run --service-ports --rm bedrock_server
