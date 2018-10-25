#!/bin/sh

set -e

CLUSTER_NAME=microservices-demo
AWS_ACCESS_KEY_ID=$(cat ~/.aws/credentials | grep ^aws_access_key_id | awk -F = '{print $2;'})
AWS_SECRET_ACCESS_KEY=$(cat ~/.aws/credentials | grep ^aws_secret_access_key | awk -F = '{print $2;'})

ecs-cli configure \
  --region eu-east-1 \
  --cluster ${CLUSTER_NAME} \
  --default-launch-type FARGATE \
  --config-name ${CLUSTER_NAME}
ecs-cli configure profile \
  --access-key ${AWS_ACCESS_KEY_ID} \
  --secret-key ${AWS_SECRET_ACCESS_KEY} \
   --profile-name ${CLUSTER_NAME}