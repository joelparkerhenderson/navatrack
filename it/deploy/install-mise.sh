#!/bin/sh

# Install Mise on a typical Unix Debian/Ubuntu system.

apt update -y
apt install -y curl
install -dm 755 /etc/apt/keyrings
curl -fSs https://mise.jdx.dev/gpg-key.pub | tee /etc/apt/keyrings/mise-archive-keyring.pub 1> /dev/null
echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.pub arch=amd64] https://mise.jdx.dev/deb stable main" | tee /etc/apt/sources.list.d/mise.list
apt update -y
apt install -y mise
