#!/bin/bash
set -e

mkdir -p /etc/authd/brokers.d/
/snap/bin/authd-msentraid.configure
cp /snap/authd-msentraid/current/conf/authd/msentraid.conf /etc/authd/brokers.d/msentraid.conf

cat <<EOF > /var/snap/authd-msentraid/current/broker.conf
[oidc]
issuer = https://login.microsoftonline.com/YOUR-TENANT-ID/v2.0
client_id = YOUR-CLIENT-ID
EOF

systemctl restart authd
snap restart authd-msentraid

# Deaktiviere den Service nach der ersten Ausführung
systemctl disable setup-authd.service
