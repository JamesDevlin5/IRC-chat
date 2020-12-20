COMMONS_URL="https://apache.osuosl.org//commons/cli/binaries/commons-cli-1.4-bin.tar.gz"

DOWNLOAD_TOOL=bash -c '\
	NAME="$$1"; \
	URL="$$2"; \
	OUT=".""$$NAME""_lib_download"; \
	\
	curl --location --output "$$OUT" "$$URL"; \
	tar -xzf "$$OUT" -C "$$PWD"; \
	\
	rm -f "$$OUT"; \
	echo "[Success] Installed:    ""$$NAME";' DOWNLOAD_TOOL

all: java

java: commons

commons:
	@$(DOWNLOAD_TOOL) commons $(COMMONS_URL)

clean_commons:
	@ls | grep -E "^commons-cli-[0-9]+(\.[0-9]+)*$$" | tr '\n' ' ' | xargs rm -rf
	@echo "[Success] Deleted:      commons"

clean: clean_commons
