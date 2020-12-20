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

clean:
	cd client_java && $(MAKE) clean
	cd server_java && $(MAKE) clean
	cd resources && $(MAKE) clean
