#!/bin/sh

set -e
set -u

PROG_DIR=$(dirname $0)

. ${PROG_DIR}/ecs-cli.conf

ecs-cli configure \
  --region ${AWS_REGION} \
  --cluster ${CLUSTER_NAME} \
  --default-launch-type FARGATE \
  --config-name ${CLUSTER_NAME}
ecs-cli configure profile \
  --access-key ${AWS_ACCESS_KEY_ID} \
  --secret-key ${AWS_SECRET_ACCESS_KEY} \
   --profile-name ${CLUSTER_NAME}