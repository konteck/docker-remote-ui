#!/bin/bash

# connect credentials
DOCKER_USER=docker2
X2GO_GROUP=x2gouser

# gen password
DOCKER_PASSWORD=$(pwgen -c -n -1 12)
DOCKER_ENCRYPTED_PASSWORD=$(perl -e 'print crypt('"$DOCKER_PASSWORD"', "aa")')

# print credentials, also with docker logs
echo User: $DOCKER_USER
echo Password: $DOCKER_PASSWORD

# add x2go connect user
useradd --create-home --home-dir /home/$DOCKER_USER --password $DOCKER_ENCRYPTED_PASSWORD \
        --shell /bin/bash --groups $X2GO_GROUP --user-group $DOCKER_USER

# run ssh server as daemon
exec /usr/sbin/sshd -D