use std::io::{Read, Write};
use std::net::{TcpListener, TcpStream};
use std::thread;
use std::str::from_utf8;

fn handle_client(mut stream: TcpStream) {
    let mut data = [0 as u8; 20]; // 20 byte buffer

    let size = stream.read(&mut data).expect("Could not read from socket!");
    println!("Received: {}", from_utf8(&data).unwrap());
    stream.write(&data[0..size]).unwrap();
}

fn main() {
    let listener = TcpListener::bind("127.0.0.1:43210").unwrap();
    println!("Server listening...");

    // accept connections and process them, each in a new spawned thread
    for stream in listener.incoming().map(|stream| stream.unwrap()) {
        println!("New connection: {}", stream.peer_addr().unwrap());
        thread::spawn(move || {
            // connection succeeded
            handle_client(stream)
        });
    }
    // close the socket server
    drop(listener);
}
