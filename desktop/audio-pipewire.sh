#!/bin/bash
set -e

sudo apt install -y \
  ddcutil \
  pipewire-alsa \
  pipewire-jack \
  pipewire-audio \
  pipewire-pulse \
  wireplumber \
  libspa-0.2-bluetooth \
  libspa-0.2-jack \
  libspa-0.2-libcamera \
  alsa-firmware-loaders \
  libasound2-plugins \
  libasound2-plugins:i386 \
  pipewire-audio-client-libraries \
  rtkit

sudo usermod -aG audio,video,i2c "$USER"

# Disable HDA power saving (prevents crackling)
sudo mkdir -p /etc/modprobe.d
echo "options snd_hda_intel power_save=0 power_save_controller=N" | \
  sudo tee /etc/modprobe.d/99-audio-disable-powersave.conf

mkdir -p ~/.config/wireplumber/wireplumber.conf.d/
mkdir -p ~/.config/pipewire/pipewire.conf.d/
mkdir -p ~/.config/pipewire/pipewire-pulse.conf.d/

# Disable suspend for ALSA devices
cat > ~/.config/wireplumber/wireplumber.conf.d/51-disable-suspend.conf << 'EOF'
monitor.alsa.rules = [
  {
    matches = [
      { node.name = "~alsa_output.*" }
    ]
    actions = {
      update-props = {
        session.suspend-timeout-seconds = 0
      }
    }
  }
]
EOF

# Stable HDMI clock configuration
cat > ~/.config/pipewire/pipewire.conf.d/10-clock.conf << 'EOF'
context.properties = {
    default.clock.rate          = 48000
    default.clock.allowed-rates = [ 48000 ]
    default.clock.quantum       = 1024
    default.clock.min-quantum   = 512
    default.clock.max-quantum   = 2048
}
EOF

# Prevent Pulse clients from forcing tiny buffers
cat > ~/.config/pipewire/pipewire-pulse.conf.d/10-pulse.conf << 'EOF'
pulse.properties = {
    pulse.min.req     = 1024/48000
    pulse.default.req = 1024/48000
    pulse.max.req     = 2048/48000
}
EOF

systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user restart pipewire pipewire-pulse wireplumber
