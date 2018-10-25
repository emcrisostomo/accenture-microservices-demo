#!/bin/sh

set -e
set -u

PROG_DIR=$(dirname $0)

. ${PROG_DIR}/ecs-cli.conf

ecs-cli compose \
  --file stack.yaml \
  --project-name ${CLUSTER_NAME} \
  service ps \
    --cluster-config ${CLUSTER_NAME}