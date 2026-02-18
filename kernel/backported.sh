#!/bin/bash
set -e
# check if running on trixie not forky or sid or others, if not, exit with message
if ! grep -q "VERSION_CODENAME=trixie" /etc/os-release; then
    echo "This script is intended for Debian Trixie. Exiting."
    exit 1
fi

#check if backports is already enabled
if ! grep -q "deb.*trixie-backports" /etc/apt/sources.list /etc/apt/sources.list.d/*.list 2>/dev/null; then
    echo "deb http://deb.debian.org/debian trixie-backports main" | sudo tee /etc/apt/sources.list.d/backports.list
    sudo apt update
else
    echo "Backports already enabled. Skipping."
fi

sudo apt install -t trixie-backports linux-headers-amd64 linux-image-amd64 -y
