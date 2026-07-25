#!/bin/sh

# Make Python trust the local Certificate Authority.
SSL_CERT_FILE=/etc/ssl/certs/example-fullchain.pem

# Use websockify to translate WebSockets on port 9001 to TLS on port 9000.
websockify 9001 localhost:9000 \
  --daemon \
  -v \
  --log-file /var/log/websockify.log \
  --ssl-target \
  --ssl-only \
  --cert=/etc/ssl/certs/example-public.pem \
  --key=/etc/ssl/private/example-private.pem