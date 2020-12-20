pyserver:
	python3 server_py/server.py

ps: pyserver

pyclient:
	python3 client_py/client.py

pc: pyclient

rserver:
	cd server_rs && cargo run

rs: rserver

rclient:
	cd client_rs && cargo run

rc: rclient

jserver: deps
	cd server_java && $(MAKE)

js: jserver

jclient: deps
	cd client_java && $(MAKE)

jc: jclient

deps:
	cd resources && $(MAKE)

cleanjava:
	@cd client_java && $(MAKE) clean
	@cd server_java && $(MAKE) clean
	@echo "Cleaned Java"

cleanrust:
	@cd client_rs && cargo clean
	@cd server_rs && cargo clean
	@echo "Cleaned Rust"

cleanresources:
	@cd resources && $(MAKE) clean
	@echo "Cleaned Resources"

clean: cleanjava cleanrust cleanresources
