#!/usr/bin/env bash
set -e

echo "Setting up Flatpak for GNOME"

sudo apt install -y \
  gnome-software-plugin-flatpak \
  xdg-desktop-portal \
  xdg-desktop-portal-gnome
