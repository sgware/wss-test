import java.io.*;
import java.net.*;
import javax.net.ssl.*;

public class EchoServer {
	
	public static final int PORT = 9000;
	
	public static void main(String[] args) throws Exception {
		System.out.println("Java TLS echo server started.");
		SSLServerSocketFactory factory = (SSLServerSocketFactory) SSLServerSocketFactory.getDefault();
		SSLServerSocket server = (SSLServerSocket) factory.createServerSocket(PORT);
		System.out.println("Java TLS echo server now listening on port " + PORT + ".");
		while(!server.isClosed()) {
			try {
				SSLSocket socket = (SSLSocket) server.accept();
				BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
				BufferedWriter out = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
				System.out.println("A new client has connected.");
				String string = in.readLine();
				System.out.println("The client sent: \"" + string + "\".");
				out.append(string);
				out.append("\n");
				out.flush();
				socket.close();
				System.out.println("The client has been disconnected.");
			}
			catch(Exception exception) {
				exception.printStackTrace();
			}
		}
	}
}