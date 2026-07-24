#!/bin/sh

# Start the Java echo server using the local keystore.
java \
  -Djavax.net.ssl.keyStore="keystore.p12" \
  -Djavax.net.ssl.keyStorePassword="changeit" \
  -cp bin \
  EchoServer
