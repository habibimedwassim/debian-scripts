#!/usr/bin/env bash
set -e

wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
sudo mv winetricks /usr/local/bin/

cat > ~/.local/share/applications/winetricks.desktop << 'EOF'
[Desktop Entry]
Name=Winetricks
Comment=Work around problems with Wine
Exec=/usr/local/bin/winetricks --gui
Icon=winetricks
Type=Application
Terminal=false
Categories=Utility;Emulator;
StartupNotify=true
EOF
