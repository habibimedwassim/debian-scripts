#!/bin/bash
set -e

curl -fsSL \
https://developer.download.nvidia.com/compute/cuda/repos/debian13/x86_64/8793F200.pub | \
sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/nvidia-cuda.gpg

echo "deb https://developer.download.nvidia.com/compute/cuda/repos/debian13/x86_64/ /" | \
sudo tee /etc/apt/sources.list.d/nvidia-cuda.list

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
  nvidia-open \
  nvidia-vaapi-driver \
  vulkan-tools \
  vulkan-validationlayers \
  libnvidia-encode1 \
  libnvidia-fbc1
