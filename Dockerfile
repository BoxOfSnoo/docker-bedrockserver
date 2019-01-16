# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.11

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# update packages and install dependencies
RUN apt-get update \
    && apt-get -y install unzip libcurl4 curl nano \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -ms /bin/bash bedrock

WORKDIR /home/bedrock

# Copy the startup script
COPY ./startup.sh .

RUN chmod +x startup.sh \
    && mkdir -p bedrock_server/worlds \
    && mkdir -p bedrock_server/config \
    && chown -R bedrock:bedrock .

# If you enable the USER below, there will be permission issues with shared volumes
USER bedrock

# create volumes for settings that need to be persisted.
VOLUME /home/bedrock/bedrock_server/worlds /home/bedrock/bedrock_server/config

EXPOSE 19132/udp 19133/udp

ENTRYPOINT /home/bedrock/startup.sh
