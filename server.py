import socket

HOST = "127.0.0.1"
PORT = 65432


class Server:
    def __init__(self):
        self._socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    def bind(self, addr):
        self._socket.bind(addr)

    def listen(self):
        self._socket.listen()

    def accept(self):
        return self._socket.accept()

    def close(self):
        self._socket.shutdown(socket.SHUT_RDWR)
        self._socket.close()


server = Server()
server.bind((HOST, PORT))
server.listen()


conn, addr = server.accept()

print(f"Connected to {addr}")
while True:
    data = conn.recv(1024)
    if not data:
        break
    print(f"Sending {repr(data)}")
    conn.sendall(data)

conn.close()
server.close()
