#!/bin/bash
set -e

sudo apt install -y \
  firmware-linux \
  firmware-linux-nonfree \
  firmware-misc-nonfree \
  firmware-iwlwifi \
  firmware-realtek \
  firmware-mediatek \
  firmware-sof-signed \
  intel-microcode
