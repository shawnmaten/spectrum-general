#!/bin/sh
set -euo pipefail

# Temporary, CoreOS docker version is off for some reason
export DOCKER_API_VERSION="1.22"

# Re-issue the certificate.
docker run \
  --rm \
  --volume general_letsencrypt_1:/etc/letsencrypt \
  --volume general_letsencrypt_2:/var/lib/letsencrypt \
  quay.io/letsencrypt/letsencrypt renew \
  -q \
  --authenticator webroot \
  --webroot-path /etc/letsencrypt/webrootauth/

# Send NGINX a SIGHUP to trigger it to reload its configuration without shutting down.
docker kill --signal=HUP general_nginx_1
