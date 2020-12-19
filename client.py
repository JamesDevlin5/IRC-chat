import socket

HOST = "127.0.0.1"
PORT = 65432


class Client:
    def __init__(self):
        self._socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    def connect(self, addr):
        self._socket.connect(addr)

    def send(self, msg):
        self._socket.sendall(msg)

    def recv(self):
        return self._socket.recv(1024)

    def close(self):
        self._socket.shutdown(socket.SHUT_RDWR)
        self._socket.close()


client = Client()
client.connect((HOST, PORT))
client.send(b"Hello World!")
data = client.recv()

print(f"Received {repr(data)}")

client.close()
