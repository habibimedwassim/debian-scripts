#!/bin/bash
set -e

sudo apt install -y \
  flatpak \
  plasma-discover-backend-flatpak

sudo flatpak remote-add --if-not-exists flathub \
  https://flathub.org/repo/flathub.flatpakrepo
