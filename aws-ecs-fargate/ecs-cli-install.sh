#!/bin/sh

set -e

MAC_URL=https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-darwin-amd64-latest
LINUX_URL=https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
INSTALL_PATH=/usr/local/bin/ecs-cli

curl -o ${INSTALL_PATH} ${LINUX_URL}
chmod +x ${INSTALL_PATH}

${INSTALL_PATH} --version