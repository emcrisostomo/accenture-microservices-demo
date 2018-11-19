FROM openjdk:11-jdk-slim
MAINTAINER Enrico M. Crisostomo <enrico.m.crisostomo@gmail.com>

RUN apt-get update && apt-get install curl -y && find /var/lib/apt/lists/ -type f -delete

ARG JAR_FILE
ADD target/${JAR_FILE} /service.jar

HEALTHCHECK --start-period=15s --interval=15s --timeout=10s --retries=4 CMD curl -f http://localhost:8080/actuator/health || exit 1

ENTRYPOINT ["/usr/bin/java", "-jar", "/service.jar"]