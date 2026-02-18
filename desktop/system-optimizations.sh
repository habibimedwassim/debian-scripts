#!/usr/bin/env bash
set -e

sudo apt install -y \
    eza \
    starship \
    papirus-icon-theme \
    fastfetch

BASHRC="$HOME/.bashrc"

START_MARKER="# >>> custom shell tweaks >>>"
END_MARKER="# <<< custom shell tweaks <<<"

# If the block already exists, do nothing
if grep -qF "$START_MARKER" "$BASHRC"; then
    echo "Custom bashrc block already present. Skipping."
    exit 0
fi

cat <<'EOF' >> "$BASHRC"

# >>> custom shell tweaks >>>

# Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# Changing "ls" to "eza"
alias ls='eza -al --icons --color=always --group-directories-first'
alias la='eza -a --icons --color=always --group-directories-first'
alias ll='eza -l --icons --color=always --group-directories-first'
alias lt='eza -aT --icons --color=always --group-directories-first'

# Starship prompt
eval "$(starship init bash)"

# <<< custom shell tweaks <<<
EOF

sudo tee /etc/systemd/zram-generator.conf > /dev/null << 'EOF'
[zram0]
zram-size = ram / 4
compression-algorithm = zstd
swap-priority = 100
fs-type = swap
EOF

sudo tee /etc/environment.d/90-wayland-electron.conf > /dev/null << 'EOF'
ELECTRON_OZONE_PLATFORM_HINT=x11
EOF

# Calculate RAM-based dirty limits (for 0.5% background, 2% max)
MEM_TOTAL_KB=$(grep MemTotal /proc/meminfo | awk '{print $2}')
MEM_TOTAL_BYTES=$((MEM_TOTAL_KB * 1024))

DIRTY_BG=$((MEM_TOTAL_BYTES / 200))   # 0.5% of total RAM
DIRTY_MAX=$((MEM_TOTAL_BYTES / 50))   # 2% of total RAM

# Optional: clamp to reasonable upper bounds to avoid crazy values on huge RAM
MAX_BG=$((1024 * 1024 * 1024))       # 1GB
MAX_MAX=$((4 * 1024 * 1024 * 1024))  # 4GB

(( DIRTY_BG > MAX_BG )) && DIRTY_BG=$MAX_BG
(( DIRTY_MAX > MAX_MAX )) && DIRTY_MAX=$MAX_MAX

sudo tee /etc/sysctl.d/99-desktop.conf > /dev/null <<EOF
# Desktop responsiveness tuning

vm.swappiness = 15
vm.vfs_cache_pressure = 50
vm.dirty_background_bytes = $DIRTY_BG
vm.dirty_bytes = $DIRTY_MAX

net.ipv4.icmp_ignore_bogus_error_responses = 1
EOF