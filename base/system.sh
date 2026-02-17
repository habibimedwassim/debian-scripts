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
  nvme-cli \
  smartmontools \
  pciutils \
  usbutils

sudo extrepo enable winehq

sudo apt update
sudo apt autoremove -y
