#!/bin/sh

set -e

STACK_NAME=spring-boot-on-lambda-demo
REPO_ROOT=$(dirname $0)

cd ${REPO_ROOT}
./mvnw -P aws-serverless -D skipTests=true clean package
aws cloudformation delete-stack --stack-name ${STACK_NAME}
aws cloudformation package --template-file sam.yaml --output-template-file target/output-sam.yaml --s3-bucket ${STACK_NAME}
aws cloudformation deploy --template-file target/output-sam.yaml --stack-name ${STACK_NAME} --capabilities CAPABILITY_IAM
aws cloudformation describe-stacks --stack-name ${STACK_NAME}
