#!/usr/bin/env bash
set -e

# Install dependencies
sudo apt update
sudo apt install -y \
    python3-pip \
    python3-setuptools \
    python3-venv \
    pipx

# Ensure pipx is on PATH
pipx ensurepath

# You need a new shell for PATH update to take effect
# If running in script, force it temporarily:
export PATH="$HOME/.local/bin:$PATH"

# Install protontricks via pipx (force and include dependencies)
pipx install --force protontricks

# Install desktop integration
protontricks-desktop-install
