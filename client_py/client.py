import argparse
import socket


parser = argparse.ArgumentParser(description="An IRC client.")
parser.add_argument("host", default="127.0.0.1", help="the target host to connect to")
parser.add_argument(
    "port", type=int, default=43210, help="the target port to connect to"
)
args = parser.parse_args()


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
        self._socket.close()


client = Client()
client.connect((args.host, args.port))
client.send(b"Hello World!")
data = client.recv()

print(f"Received {repr(data)}")

client.close()
