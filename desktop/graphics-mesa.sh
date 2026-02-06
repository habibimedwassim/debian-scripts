#!/bin/bash
set -e

sudo apt install -y \
  mesa-va-drivers \
  mesa-va-drivers:i386 \
  mesa-vulkan-drivers \
  mesa-vulkan-drivers:i386 \
  intel-media-va-driver-non-free \
  vainfo \
  libvulkan-dev

sudo apt remove -y xserver-xorg-video-intel
sudo apt autoremove -y
