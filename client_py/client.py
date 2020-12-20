import argparse
import socket
import ipaddress

# Default Values
DEFAULT_HOST = "127.0.0.1"
DEFAULT_PORT = 43210


# Creates the parser with the arguments: <host>, <port>
def create_parser():
    parser = argparse.ArgumentParser(description="An IRC client.")
    parser.add_argument(
        "--host",
        "-t",
        type=ipaddress.ip_address,
        default=DEFAULT_HOST,
        help="the target host to connect to",
        required=False,
    )
    parser.add_argument(
        "--port", "-p", type=int, default=DEFAULT_PORT, help="the target port to connect to", required=False,
    )
    return parser


def create_socket(addr):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect(addr)
    return sock

class Client:
    def __init__(self, addr):
        self._socket = create_socket(addr)

    def send(self, msg):
        self._socket.sendall(msg.encode("utf-8"))

    def recv(self):
        return self._socket.recv(1024).decode("utf-8")

    def close(self):
        self._socket.close()


args = create_parser().parse_args()
target = (args.host.exploded, args.port)
client = Client(target)

client.send("Hello World!")
data = client.recv()

print(f"Received {repr(data)}")

client.close()
