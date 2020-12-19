pyserver:
	python3 server.py

ps: pyserver


pyclient:
	python3 client.py

pc: pyclient

rserver:
	rustc server.rs
	./server

rs: rserver

rclient:
	rustc client.rs
	./client

rc: rclient

clean:
	-rm {client,server}

