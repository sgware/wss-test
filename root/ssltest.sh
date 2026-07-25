#!/bin/sh

# Confirm OpenSSL can connect to the Java echo server.
(echo "I am OpenSSL!\n"; sleep 1) | openssl s_client -connect localhost:9000 -CAfile /etc/ssl/certs/example-public.pem
