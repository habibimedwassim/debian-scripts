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
  pipewire-audio-client-libraries

sudo usermod -aG audio,video,disk,adm,i2c "$USER"

mkdir -p ~/.config/wireplumber/wireplumber.conf.d/
mkdir -p ~/.config/pipewire/pipewire.conf.d/

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

cat > ~/.config/pipewire/pipewire.conf.d/99-low-latency.conf << 'EOF'
context.properties = {
  default.clock.rate = 48000
  default.clock.allowed-rates = [ 44100 48000 ]
  default.clock.quantum = 512
  default.clock.min-quantum = 512
  default.clock.max-quantum = 512
}
EOF

systemctl --user enable --now pipewire wireplumber
systemctl --user restart pipewire wireplumber
