#!/bin/bash
set -e

wget -qO - https://dl.xanmod.org/archive.key | sudo gpg --dearmor -vo /etc/apt/keyrings/xanmod-archive-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/xanmod-release.list

sudo apt update
sudo apt install --no-install-recommends dkms libdw-dev clang lld llvm -y
sudo apt update
sudo apt install linux-xanmod-x64v3 -y
