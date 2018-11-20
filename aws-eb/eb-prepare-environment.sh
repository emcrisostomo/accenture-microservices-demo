#!/bin/sh

set -e

PROG_DIR=$(dirname $0)
BACKEND_DIR=${PROG_DIR}/../backend
JAR_FILE=accenture-microservices-demo-0.0.1-SNAPSHOT.jar

make -C ${BACKEND_DIR} clean-spring-boot package-spring-boot
cd ${PROG_DIR}
cp ${BACKEND_DIR}/target/${JAR_FILE} .
