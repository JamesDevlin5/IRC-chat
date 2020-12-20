COMMONS_URL:="https://apache.osuosl.org//commons/cli/binaries/commons-cli-1.4-bin.tar.gz"
COMMONS_ZIP:=commons.tar.gz

all: java

java: commons

commons:
	curl --location --output $(COMMONS_ZIP) "$(COMMONS_URL)"
	tar -xzf $(COMMONS_ZIP)
	$(RM) $(COMMONS_ZIP)
	@echo "Commons java framework installed."

clean_commons:
	@ls | grep -E "^commons-cli-[0-9]+(\.[0-9]+)*$$" | tr '\n' ' ' | xargs rm -rf
	@echo "Commons java framework uninstalled."

clean: clean_commons

