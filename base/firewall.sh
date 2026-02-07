#!/usr/bin/env bash
set -e

echo "Installing UFW..."
sudo apt install -y ufw

echo "Setting default firewall policies..."
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow SSH only if the service exists
if systemctl list-unit-files | grep -q '^ssh\.service'; then
    echo "Allowing SSH..."
    sudo ufw allow ssh
fi

echo "Enabling firewall..."
sudo ufw --force enable

echo "Firewall status:"
sudo ufw status verbose
