#!/bin/bash
set -e

sudo tee /etc/sysctl.d/99-desktop.conf > /dev/null << 'EOF'
vm.swappiness = 15
vm.vfs_cache_pressure = 50
vm.dirty_background_ratio = 5
vm.dirty_ratio = 15
EOF
