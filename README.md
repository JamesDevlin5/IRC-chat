# IRC Chat

This program will offer an implementation of a real-time chat application.

## Server

In this chat application, there will be a centralized server which registers users.
In order to join a chat, the client program must connect to the host that is running
the server, on the port that it is listening to.

Initially, this server will have to process all messages and disper them to all neighbors.
A client's initial connection will be long lasting, and all messages will pass transparently
through the server. The server will act as a broadcasting station, repeating messages to
all others in the network. This means that each client connection may be checked for
incoming messages easily, but will require a thread-safe data structure when writing to
any files or file descriptors.

In the future, the server may be able to take on more of a DNS role. Optimally, it would
be optional for a group of clients to create a peer-to-peer network which acts as a mesh.
Otherwise, it will be possible to interact directly with the server, obfuscating
your IP address from anyone on the server besides the host.

## Client

The client program will eagerly reach out to the target server on startup, in order to
establish a connection. The client must then successfully register with the host server.

Once functioning normally, the client will passively listen for any messages from peers
in the network, and display them on screen if found. The user will be able to type and send
messages to peers at their convenience as well.

It is expected that the server will outlive the client. The server should be conceptually
"constantly running" and if broken, the client will be unusable as well.
