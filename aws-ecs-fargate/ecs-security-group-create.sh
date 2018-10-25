#!/bin/sh

set -e
set -u

PROG_DIR=$(dirname $0)

. ${PROG_DIR}/ecs-cli.conf

aws ec2 create-security-group --group-name ${CLUSTER_NAME}-sg --description "${CLUSTER_NAME} - Security group" --vpc-id ${VPC_ID}