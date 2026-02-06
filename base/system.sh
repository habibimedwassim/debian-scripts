#!/bin/bash
set -e

sudo apt update
sudo apt upgrade -y

sudo dpkg --add-architecture i386
sudo apt update

sudo apt install -y \
  git \
  gzip \
  cmake \
  curl \
  wget \
  unzip \
  p7zip-full \
  ffmpeg \
  vim \
  build-essential \
  pkg-config \
  systemd-zram-generator \
  extrepo

sudo apt install -y \
  fonts-inter* \
  fonts-noto*

sudo apt install -y \
  nvme-cli \
  smartmontools \
  pciutils \
  usbutils

sudo extrepo enable winehq
sudo extrepo enable deb-multimedia

sudo apt update
sudo apt dist-upgrade -y
sudo apt autoremove -y
