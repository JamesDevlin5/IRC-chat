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

jserver:
	cd server_java && $(MAKE)

js: jserver

jclient:
	cd client_java && $(MAKE)

jc: jclient

clean:
	cd client_java && $(MAKE) clean
	cd server_java && $(MAKE) clean
