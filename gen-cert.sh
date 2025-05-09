openssl req -x509 \
  -newkey rsa:4096 \
  -keyout ./var-lib-apps/rt/certs/priv.pem \
  -out ./var-lib-apps/rt/certs/pub.pem \
  -days 90 \
  -nodes
