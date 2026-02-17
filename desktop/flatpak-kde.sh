#!/usr/bin/env bash
set -e

echo "Setting up Flatpak for KDE Plasma"

sudo apt install -y \
  flatpak \
  plasma-discover-backend-flatpak \
  xdg-desktop-portal \
  xdg-desktop-portal-kde

flatpak remote-add --if-not-exists flathub \
  https://flathub.org/repo/flathub.flatpakrepo
