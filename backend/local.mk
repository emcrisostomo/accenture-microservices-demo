MVN=                 ./mvnw
PROFILE_SPRING_BOOT= spring-boot
PROFILE_AWS_LAMBDA=  aws-serverless
PROFILE=

.PHONY: clean-profile
clean-profile:
	$(MVN) -P $(PROFILE) clean

.PHONY: build-profile
build-profile:
	$(MVN) -P $(PROFILE) compile

.PHONY: package-profile
package-profile:
	$(MVN) -P $(PROFILE) -DskipTests=true package

.PHONY: clean-spring-boot
clean-spring-boot: PROFILE=$(PROFILE_SPRING_BOOT)
clean-spring-boot: clean-profile

.PHONY: build-spring-boot
build-spring-boot: PROFILE=$(PROFILE_SPRING_BOOT)
build-spring-boot: build-profile

.PHONY: package-spring-boot
package-spring-boot: PROFILE=$(PROFILE_SPRING_BOOT)
package-spring-boot: package-profile

.PHONY: clean-aws-lambda
clean-aws-lambda: PROFILE=$(PROFILE_AWS_LAMBDA)
clean-aws-lambda: clean-profile

.PHONY: build-aws-lambda
build-aws-lambda: PROFILE=$(PROFILE_AWS_LAMBDA)
build-aws-lambda: build-profile

.PHONY: package-aws-lambda
package-aws-lambda: PROFILE=$(PROFILE_AWS_LAMBDA)
package-aws-lambda: package-profile
