default:
	@echo "[Error] Default:       no default option available"
	@echo "        Specify:"
	@echo "            1.  Whether you are running the client or server"
	@echo "            2.  Which language you are running (python, rust, java)"

pyserver:
	python3 server_py/server.py

ps: pyserver

pyclient:
	python3 client_py/client.py

pc: pyclient

rserver: cleanrust
	cd server_rs && cargo run

rs: rserver

rclient: cleanrust
	cd client_rs && cargo run

rc: rclient

jserver: deps cleanjava
	cd server_java && $(MAKE)

js: jserver

jclient: deps cleanjava
	cd client_java && $(MAKE)

jc: jclient

deps: cleanresources
	cd resources && $(MAKE)

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
