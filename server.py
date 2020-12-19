import socket

HOST = '127.0.0.1'
PORT = 65432

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
    sock.bind((HOST, PORT))
    sock.listen()
    conn, addr = sock.accept()
    with conn:
        print(f'Connected to {addr}')
        while True:
            data = conn.recv(1024)
            if not data:
                break
            print(f'Sending {repr(data)}')
            conn.sendall(data)
