#!/bin/sh

webroot_dir=/etc/letsencrypt/webrootauth/
dhparams_file=/etc/letsencrypt/dhparams.pem
cert_dir=/etc/letsencrypt/live/spectrumatutsa.org/

if [ ! -d $webroot_dir ]; then
  mkdir -p $webroot_dir
fi

if [ ! -f $dhparams_file ]; then
  openssl dhparam -out "$dhparams_file" 2048
fi

if [ ! -d $cert_dir ]; then
  mkdir -p $cert_dir
fi

while [ ! -f "${cert_dir}fullchain.pem" ]; do
  echo "Waiting for certs to exist..."
  sleep 10
done

echo "All certs found. Starting nginx..."

nginx -g "daemon off;"
