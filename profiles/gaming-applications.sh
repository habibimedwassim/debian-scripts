#!/bin/bash
set -e
sudo apt install --include-recommends -y winehq-stable

sudo apt install -y \
  unrar \
  mangohud \
  mangohud:i386 \
  steam-installer \
  steam-devices \
  steam-libs \
  steam-libs-i386 \
  goverlay \
  gamemode \
  lutris