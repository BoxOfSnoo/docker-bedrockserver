# Docker Bedrock Server

This is a simple docker container for Mojang's bedrock server software.

This docker image downloads and runs the Bedrock Dedicated Server at runtime.

## Quick start

### Windows users

* Clone this repository to a local folder
* Run `startserver.cmd` in a command prompt

### Linux users

* Clone this repository to a local folder
* Run `startserver.sh`

## Customisation

### Update for newer Bedrock Server version

When Mojang update the Bedrock Dedicated Server to a new version (current version 1.9.0) update the `docker-compose.yml` file to point to the new URI and change the tag number in the image node to reflect the new version.

### Modify server settings

The quick start above will automatically create a default set of server settings.  You can customise this by copying the `server.properties.default` file to `server.properties` and edit it to your preferences.

### Adding existing Worlds

You can put an existing Bedrock world file in the data/worlds folder and point to it using the `level-name=` setting in the server.properties file.

### Building the docker image manually

Change to the directory containing the Dockerfile and run:

```bash
docker build -t bedrock_server .
```

### Running docker-compose

If you are used to using docker-compose, you may be used to using `docker-compose up` **don't do this here**, because you want to attach to the server with an interactive session.

Instead, use:

```bash
docker-compose run --service-ports --rm bedrock_server
```

This will also remove the container after running.  Run `docker-compose down` to remove the remaining network setup.  `--service-ports` is required to expose the ports when using `run`.  This command is in the `startserver.sh` and `startserver.cmd` files for convenience.
