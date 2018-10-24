default:
	@echo "Default no-op target"

-include *.mk

mvn-wrapper-update:
	./mvnw -N io.takari:maven:wrapper
