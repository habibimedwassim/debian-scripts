#!/usr/bin/env bash
set -e

CONF_FILE="/etc/fonts/local.conf"

echo "Installing Fonts..."
sudo apt install -y \
  fonts-inter* \
  fonts-noto*

sudo install -d -m 0755 /etc/fonts

sudo tee "$CONF_FILE" >/dev/null <<'EOF'
<?xml version="1.0"?>
 <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
 <fontconfig>
   <selectfont>
     <rejectfont>
       <glob>/usr/share/fonts/truetype/noto/NotoNastaliq\*</glob>
     </rejectfont>
   </selectfont>
   <alias>
     <family>sans-serif</family>
     <prefer>
       <family>Noto Sans</family>
       <family>Noto Sans Arabic UI</family>
     </prefer>
   </alias>
   <alias>
     <family>serif</family>
     <prefer>
       <family>Noto Serif</family>
       <family>Noto Naskh Arabic UI</family>
     </prefer>
   </alias>
   <match target="pattern">
     <test name="lang" compare="contains"><string>ar</string></test>
     <edit name="family" mode="prepend" binding="strong">
       <string>Noto Sans Arabic UI</string>
     </edit>
   </match>
 </fontconfig>
EOF
sudo fc-cache -f -v
