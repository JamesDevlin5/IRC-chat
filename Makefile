default:
	@echo "[Error] Default:       no default option available"
	@echo "        Specify:"
	@echo "            1.  Whether you are running the client or server"
	@echo "            2.  Which language you are running (python, rust, java)"

define make_target
	cd $(1) && $(MAKE)
endef

pyserver:
	@$(call make_target,server_py)

ps: pyserver

pyclient:
	@$(call make_target,client_py)

pc: pyclient

rserver: cleanrust
	@$(call make_target,server_rs)

rs: rserver

rclient: cleanrust
	@$(call make_target,client_rs)

rc: rclient

jserver: deps cleanjava
	@$(call make_target,server_java)

js: jserver

jclient: deps cleanjava
	@$(call make_target,client_java)

jc: jclient

deps: cleanresources
	@$(call make_target,resources)

cleanjava:
	@cd client_java && $(MAKE) clean
	@cd server_java && $(MAKE) clean

cleanrust:
	@cd client_rs && cargo clean
	@cd server_rs && cargo clean

cleanresources:
	@cd resources && $(MAKE) clean

clean: cleanjava cleanrust cleanresources
	@echo "[Success] Complete:     all non-essential files cleaned"
