#!/bin/sh

set -e
set -u

docker tag \
  localhost:5000/accenture-microservices-demo:0.0.1-SNAPSHOT \
  ${REPOSITORY_NAME}/accenture-microservices-demo:0.0.1-SNAPSHOT

docker push ${REPOSITORY_NAME}/accenture-microservices-demo:0.0.1-SNAPSHOT