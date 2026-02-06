#!/usr/bin/env bash
set -e

GITHUB_BASE="https://raw.githubusercontent.com/habibimedwassim/debian-scripts/main"

# Helper to run remote scripts
run_remote() {
    local url="$1"
    echo "Running $url..."
    bash -c "$(curl -fsSL "$url")"
}

### --------------------------------------------------
### Base
### --------------------------------------------------
run_remote "$GITHUB_BASE/base/system.sh"
run_remote "$GITHUB_BASE/base/firmware.sh"

### --------------------------------------------------
### Desktop
### --------------------------------------------------
run_remote "$GITHUB_BASE/desktop/graphics-mesa.sh"
run_remote "$GITHUB_BASE/desktop/audio-pipewire.sh"
run_remote "$GITHUB_BASE/desktop/kde-flatpak.sh"
run_remote "$GITHUB_BASE/desktop/sysctl.sh"

### --------------------------------------------------
### Kernel
### --------------------------------------------------
run_remote "$GITHUB_BASE/kernel/liquorix.sh"

### --------------------------------------------------
### Hardware
### --------------------------------------------------
run_remote "$GITHUB_BASE/hardware/nvidia-open.sh"

### --------------------------------------------------
### Profiles
### --------------------------------------------------
run_remote "$GITHUB_BASE/profiles/gaming-meta.sh"
run_remote "$GITHUB_BASE/profiles/gaming-applications.sh"
run_remote "$GITHUB_BASE/profiles/install-heroic.sh"
run_remote "$GITHUB_BASE/profiles/install-github-desktop.sh"

echo "All done. Reboot recommended."
