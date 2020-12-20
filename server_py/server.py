import argparse
import socket
import ipaddress

# Default Values
DEFAULT_HOST = "127.0.0.1"
DEFAULT_PORT = 43210

# Creates the parser with the arguments: <host> <port>
def create_parser():
    parser = argparse.ArgumentParser(description="An IRC server.")
    parser.add_argument(
        "--host",
        "-t",
        type=ipaddress.ip_address,
        default=DEFAULT_HOST,
        help="the host to listen on",
        required=False,
    )
    parser.add_argument(
        "--port", "-p", type=int, default=DEFAULT_PORT, help="the target port to listen on", required=False,
    )
    return parser


def create_socket(addr):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.bind(addr)
    sock.listen()
    return sock

class Server:
    def __init__(self, addr):
        self._socket = create_socket(addr)

    def accept(self):
        return self._socket.accept()

    def close(self):
        self._socket.close()


args = create_parser().parse_args()
target = (args.host.exploded, args.port)
server = Server(target)


class Connection:
    def __init__(self, sock):
        self._socket = sock

    def send(self, msg):
        self._socket.sendall(msg.encode("utf-8"))

    def recv(self):
        return self._socket.recv(1024)

    def close(self):
        self._socket.close()


conn, addr = server.accept()
client = Connection(conn)

print(f"Connected to {addr}")

data = client.recv()
print(f"Received: {repr(data)}")

conn.sendall(data)

client.close()
server.close()
