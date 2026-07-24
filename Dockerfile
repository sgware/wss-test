FROM ubuntu:26.04

# Install Apache, Java JDK, and websockify.
RUN apt update && apt install -y nano apache2 default-jdk websockify
# Eanble HTTPS in Apache.
RUN a2enmod ssl

# Copy files into the image.
COPY root /

# Generate a new self-signed public private key pair.
RUN ./self_sign.sh
# Import the keys into a Java keystore.
WORKDIR /opt/echo
RUN rm -f keystore.p12
RUN ./keystore.sh
# Compile the Java server.
RUN rm -f EchoServer.class
RUN ./compile.sh

# Disable default Apache site and enable example site.
RUN a2dissite 000-default.conf
RUN a2ensite example.conf

# Start Apache. Start websockify. Start the Java echo server.
CMD ["sh", "-c", "apache2ctl start && ./websockify.sh && ./run.sh"]