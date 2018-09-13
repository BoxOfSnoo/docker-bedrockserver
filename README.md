This is a simple docker container for Mojang's bedrock server software.

The startup script will download and unpack the server software from Mojang's site.  Update the link in the `docker-compose.yml` file to get the latest version.

Copy the `server.properties.default` file to `server.properties` and edit it to your preferences.  You can put an existing Bedrock world file in the data/worlds folder and point to it using the `level-name=` setting in the server.properties file.

Build the docker image first.  Change to the directory containing the Dockerfile and run:

```
docker build -t bedrock_server .
```

If you are used to using docker-compose, you may be used to using `docker-compose up` **don't do this here**, because you want to attach to the server with an interactive session.

Instead, use:

```
docker-compose run --service-ports --rm bedrock_server
```

This will also remove the container after running.  Run `docker-compose down` to remove the remaining network setup.  `--service-ports` is required to expose the ports when using `run`.  This command is in the startserver.sh file for convenience.
