#!/bin/bash
set -e

sudo tee /etc/systemd/zram-generator.conf > /dev/null << 'EOF'
[zram0]
zram-size = ram / 4
compression-algorithm = zstd
swap-priority = 100
fs-type = swap
EOF
