rem check that there is a server.properties file in the data directory.
rem otherwise when the volumes are created, server.properties will be
rem a directory, not a file.
if not exist "data\server.properties" (
    rem if the default file is missing, exit with error.
    if not exist ".\data\server.properties.default" (
        echo Error data/server.properties does not exist and cannot create default since data/server.properties.default does not exist. 1>&2
        exit /b 1
    )

    copy ".\data\server.properties.default" ".\data\server.properties" /y
)

docker-compose run --service-ports --rm bedrock_server
