use std::io::{Read, Write};
use std::net::TcpStream;
use std::str::from_utf8;

fn main() {
    // connect
    let mut stream = TcpStream::connect("localhost:43210").expect("Could not connect!");

    let msg = b"Hello World!";
    stream.write(msg).expect("Could not write to socket!");

    // use a 20 byte buffer
    let mut data = [0 as u8; 20];
    stream.read(&mut data).expect("Could not read from socket!");

    println!("Received: {}", &from_utf8(&data).unwrap());

    // cleanup
    drop(stream);
}
