MVN=                 ./mvnw
PROFILE_SPRING_BOOT= spring-boot
PROFILE_AWS_LAMBDA=  aws-serverless
PROFILE=

.PHONY: check-profile
check-profile:
	@if ! test -n "$(PROFILE)" ; then printf "%s\n" "PROFILE has not been set" >&2 ; false ; fi

.PHONY: clean-profile
clean-profile: check-profile
	$(MVN) -P $(PROFILE) clean

.PHONY: build-profile
build-profile: check-profile
	$(MVN) -P $(PROFILE) compile

.PHONY: package-profile
package-profile: check-profile
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

.PHONY: build-spring-boot-docker-image
build-spring-boot-docker-image: PROFILE=$(PROFILE_SPRING_BOOT)
build-spring-boot-docker-image:
	$(MVN) -P $(PROFILE) dockerfile:build

.PHONY: push-spring-boot-docker-image
push-spring-boot-docker-image: PROFILE=$(PROFILE_SPRING_BOOT)
push-spring-boot-docker-image:
	$(MVN) -P $(PROFILE) dockerfile:push
