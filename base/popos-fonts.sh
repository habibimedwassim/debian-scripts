#!/usr/bin/env bash
set -e

# Update and install required packages
sudo apt update
sudo apt install -y git make fontconfig

# Create a temporary directory
TMP_DIR=$(mktemp -d)

# Ensure temporary directory is cleaned up on exit
trap 'rm -rf "$TMP_DIR"' EXIT

# Clone Pop!_OS fonts
git clone https://github.com/pop-os/fonts.git "$TMP_DIR/fonts"

# Install fonts
sudo mkdir -p /usr/local/share/fonts/pop-os
sudo cp -r "$TMP_DIR/fonts/"* /usr/local/share/fonts/pop-os/

# Refresh font cache
sudo fc-cache -fv
