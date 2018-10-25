#!/bin/sh

set -e
set -u

PROG_DIR=$(dirname $0)

. ${PROG_DIR}/ecs-cli.conf

ecs-cli up --cluster-config ${CLUSTER_NAME}