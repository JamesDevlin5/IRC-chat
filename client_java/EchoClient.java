import java.io.*;
import java.net.*;

public class EchoClient {
    private static final String DEFAULT_HOST = "127.0.0.1";
    private static final int DEFAULT_PORT = 43210;

    public static void main(String[] args) throws IOException {

        String host = DEFAULT_HOST;
        int port = DEFAULT_PORT;
        if (args.length == 2) {
            host = args[0];
            port = Integer.parseInt(args[1]);
        }
        else if (args.length == 1) {
            port = Integer.parseInt(args[0]);
        }

        System.out.println("Connecting to (" + host + ":" + port + ")");

        try (
            Socket echoSocket = new Socket(host, port);
            PrintWriter out = new PrintWriter(echoSocket.getOutputStream(), true);
            BufferedReader in = new BufferedReader(
                new InputStreamReader(echoSocket.getInputStream())
            );
            BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in));
        ) {
            String userInput;
            
            if ((userInput = stdIn.readLine()) != null) {
                out.println(userInput);
                System.out.println("echo: " + in.readLine());
            }
        } catch (UnknownHostException e) {
            System.err.println("Invalid host " + host);
            System.exit(1);
        } catch (IOException e) {
            System.err.println("I/O error");
            System.exit(1);
        }

    }
}
