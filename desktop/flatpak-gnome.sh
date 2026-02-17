#!/usr/bin/env bash
set -e

echo "Setting up Flatpak for GNOME"

sudo apt install -y \
  flatpak \
  gnome-software-plugin-flatpak \
  xdg-desktop-portal \
  xdg-desktop-portal-gnome

flatpak remote-add --if-not-exists flathub \
  https://flathub.org/repo/flathub.flatpakrepo
