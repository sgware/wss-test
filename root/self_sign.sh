#!/bin/sh

# Create a new Certificate Authority.
openssl req \
  -x509 \
  -newkey rsa:2048 \
  -nodes \
  -keyout /etc/ssl/private/example-ca.key \
  -out /etc/ssl/certs/example-chain.pem \
  -days 36500 \
  -subj "/CN=localhost"

# Generate the server's private key.
openssl genrsa \
  -out /etc/ssl/private/example-private.pem

# Create a Certificate Signing Request.
openssl req \
  -new \
  -key /etc/ssl/private/example-private.pem \
  -out /etc/ssl/certs/example.csr \
  -subj "/CN=localhost" \
  -addext "subjectAltName=DNS:localhost,IP:127.0.0.1"

# Sign the public key.
openssl x509 \
  -req \
  -in /etc/ssl/certs/example.csr \
  -CA /etc/ssl/certs/example-chain.pem \
  -CAkey /etc/ssl/private/example-ca.key \
  -CAcreateserial \
  -out /etc/ssl/certs/example-public.pem \
  -days 36500 \
  -copy_extensions copy

# Concatenate the certificate and the certificate chain.
cat /etc/ssl/certs/example-public.pem /etc/ssl/certs/example-chain.pem > /etc/ssl/certs/example-fullchain.pem
