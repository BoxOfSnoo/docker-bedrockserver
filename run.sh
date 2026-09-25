#!/bin/bash

# we execute the startup script as the 'bedrock' user.
exec /sbin/setuser bedrock /home/bedrock/startup.sh
