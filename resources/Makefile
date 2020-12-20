COMMONS_URL:="https://apache.osuosl.org//commons/cli/binaries/commons-cli-1.4-bin.tar.gz"

all: java

java: commons

commons:
	curl --location --output commons.tar.gz "$(COMMONS_URL)"
	tar -xzf commons.tar.gz
	$(RM) commons.tar.gz
	@echo "Commons java framework installed."

clean_commons:
	@ls | grep -E "^commons-cli-[0-9]+(\.[0-9]+)*$$" | tr '\n' ' ' | xargs rm -rf
	@echo "Commons java framework uninstalled."

clean: clean_commons

