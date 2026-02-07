#!/usr/bin/env bash
set -e

echo "Setting up Flatpak for KDE Plasma"

sudo apt install -y \
  plasma-discover-backend-flatpak \
  xdg-desktop-portal \
  xdg-desktop-portal-kde
