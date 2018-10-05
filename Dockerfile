FROM openjdk:10-jdk-slim
MAINTAINER Enrico M. Crisostomo <enrico.m.crisostomo@gmail.com>

ARG JAR_FILE
ADD target/${JAR_FILE} /service.jar

ENTRYPOINT ["/usr/bin/java", "-jar", "/service.jar"]