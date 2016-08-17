#!/bin/sh

cert_dir=/etc/letsencrypt/live/spectrumatutsa.org/

if [ ! -f "${cert_dir}fullchain.pem" ]; then
  certbot certonly \
    -n \
    --domain spectrumatutsa.org \
    --domain www.spectrumatutsa.org \
    --domain admin.spectrumatutsa.org \
    --domain api.spectrumatutsa.org \
    --authenticator standalone \
    --email admin@spectrumatutsa.org \
    --agree-tos

  echo "Issued new certificate."
else
  echo "Certificate already exists. Finished."
fi
