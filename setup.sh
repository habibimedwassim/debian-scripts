#!/bin/bash
set -e

./base/system.sh
./base/firmware.sh
./base/fonts.sh
./base/hardware-utils.sh

./desktop/graphics-mesa.sh
./desktop/audio-pipewire.sh
./desktop/flatpak.sh
./desktop/zram.sh
./desktop/sysctl.sh

./kernel/liquorix.sh
./hardware/nvidia.sh

./profiles/gaming-meta.sh
./profiles/gaming-applications.sh
./profiles/install-heroic.sh
./profiles/install-github-desktop.sh

echo "All done. Reboot recommended."
