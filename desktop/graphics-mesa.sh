#!/bin/bash
set -e

sudo apt install -y \
  mesa-va-drivers \
  mesa-va-drivers:i386 \
  mesa-vulkan-drivers \
  mesa-vulkan-drivers:i386 \
  intel-media-va-driver-non-free \
  libva2 \
  libva2:i386 \
  libvulkan1 \
  libvulkan1:i386 \
  vulkan-tools \
  vulkan-validationlayers \
  vainfo 

sudo apt remove -y xserver-xorg-video-intel
sudo apt autoremove -y
