default:
	@echo "[Error] Default:       no default option available"
	@echo "        Specify:"
	@echo "            1.  Whether you are running the client or server"
	@echo "            2.  Which language you are running (python, rust, java)"

define make_target
	@cd $(1) && $(MAKE)
endef

define clean_target
	-@cd $(1) && $(MAKE) clean
endef

pyserver:
	@$(call make_target,server_py)

ps: pyserver

pyclient:
	@$(call make_target,client_py)

pc: pyclient

cleanrserver:
	@$(call clean_target,server_rs)

rserver: cleanrserver
	@$(call make_target,server_rs)

rs: rserver

cleanrclient:
	@$(call clean_target,client_rs)

rclient: cleanrclient
	@$(call make_target,client_rs)

rc: rclient

cleanrust: cleanrserver cleanrclient

cleanjserver:
	@$(call clean_target,server_java)

jserver: deps cleanjserver
	@$(call make_target,server_java)

js: jserver

cleanjclient:
	@$(call clean_target,client_java)

jclient: deps cleanjclient
	@$(call make_target,client_java)

jc: jclient

deps: cleanresources
	@$(call make_target,resources)

cleanjava: cleanjserver cleanjclient

cleanrust: cleanrserver cleanrclient

cleanresources:
	@$(call clean_target,resources)

clean: cleanjava cleanrust cleanresources
	@echo "[Success] Complete:     all non-essential files cleaned"
