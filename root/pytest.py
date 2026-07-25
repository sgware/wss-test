import os
import ssl
import socket

os.environ['SSL_CERT_FILE'] = '/etc/ssl/certs/example-chain.pem'
try:
    context = ssl.create_default_context()
    client = context.wrap_socket(socket.create_connection(('localhost',9000)), server_hostname='localhost')
    client.sendall("I am Python!\n".encode('utf-8'))
    message = client.recv(1024).decode('utf-8')
    print(f"Success: {message}")
except Exception as e:
    print(f"Error: {e}")