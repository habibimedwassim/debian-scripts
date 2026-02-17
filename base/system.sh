#!/bin/bash
set -e

sudo apt update
sudo apt upgrade -y

sudo dpkg --add-architecture i386
sudo apt update

sudo apt install -y \
  firmware-linux \
  firmware-linux-nonfree \
  firmware-misc-nonfree \
  firmware-iwlwifi \
  firmware-realtek \
  firmware-mediatek \
  firmware-sof-signed \
  intel-microcode

sudo apt install -y \
  git \
  gzip \
  cmake \
  curl \
  wget \
  unzip \
  p7zip-full \
  ffmpeg \
  build-essential \
  pkg-config \
  systemd-zram-generator \
  cabextract \
  zenity \
  extrepo

sudo apt install -y \
  nvme-cli \
  smartmontools \
  pciutils \
  usbutils
  
sudo apt install -y \
  libgtk-4-dev \
  libadwaita-1-dev \
  libjsoncpp-dev \
  libzip-dev \
  librsvg2-dev

sudo extrepo enable winehq

sudo apt update
sudo apt autoremove -y
