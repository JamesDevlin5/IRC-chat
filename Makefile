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

