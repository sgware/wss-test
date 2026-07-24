#!/bin/sh

# Import the server's public and private keys into a Java keystore.
openssl pkcs12 -export \
  -in /etc/ssl/certs/example-fullchain.pem \
  -inkey /etc/ssl/private/example-private.pem \
  -out keystore.p12 \
  -name example \
  -caname root \
  -passout pass:changeit
