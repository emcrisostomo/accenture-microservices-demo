#!/bin/sh

set -e

CLUSTER_NAME=microservices-demo

ecs-cli configure --cluster ${CLUSTER_NAME} --default-launch-type FARGATE --config-name ${CLUSTER_NAME}
ecs-cli configure profile --profile-name ${CLUSTER_NAME}