#!/bin/sh

set -e

STACK_NAME=spring-boot-on-lambda-demo
PROG_DIR=$(dirname $0)
BACKEND_DIR=${PROG_DIR}/../backend
JAR_FILE=accenture-microservices-demo-0.0.1-SNAPSHOT.jar

cleanup()
{
  echo TRAPPING
  rm -f ${JAR_FILE}
}

trap cleanup INT TERM EXIT

make -C ${BACKEND_DIR} clean-aws-lambda package-aws-lambda

aws s3 mb s3://spring-boot-on-lambda-demo

if aws cloudformation delete-stack --stack-name ${STACK_NAME}
then
  sleep 10
fi

cd ${PROG_DIR}
cp ${BACKEND_DIR}/target/${JAR_FILE} .

aws cloudformation package --template-file sam.yaml --output-template-file output-sam.yaml --s3-bucket ${STACK_NAME}
aws cloudformation deploy --template-file output-sam.yaml --stack-name ${STACK_NAME} --capabilities CAPABILITY_IAM

aws cloudformation describe-stacks --stack-name ${STACK_NAME}
