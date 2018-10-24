MVN=                 ./mvnw
PROFILE_SPRING_BOOT= spring-boot
PROFILE_AWS_LAMBDA=  aws-serverless

clean-spring-boot:
	$(MVN) -P $(PROFILE_SPRING_BOOT) clean

build-spring-boot:
	$(MVN) -P $(PROFILE_SPRING_BOOT) compile

package-spring-boot:
	$(MVN) -P $(PROFILE_SPRING_BOOT) -DskipTests=true package

clean-aws-lambda:
	$(MVN) -P $(PROFILE_AWS_LAMBDA) clean

build-aws-lambda:
	$(MVN) -P $(PROFILE_AWS_LAMBDA) compile

package-aws-lambda:
	$(MVN) -P $(PROFILE_AWS_LAMBDA) -DskipTests=true package
