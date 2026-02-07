# debian-scripts

Personal, opinionated Debian setup scripts.

This repository exists for one reason: fast, repeatable Debian installs without ceremony.
No frameworks, no Ansible, no meta-packages pretending to be something they are not.
Just shell scripts that do exactly what they say.

This is not a general-purpose project. It is designed for personal use on Debian-based systems
(tested on Debian 13) and assumes you know what you are running.

## Overview

- Modular Bash scripts
- One responsibility per script
- Can be run individually or through a central setup script
- Explicit, opinionated defaults for desktop and gaming use

This repository makes no attempt to be clever or universal.

## Structure

base/
Core system setup. These scripts are expected to run on every install.

Includes:
- Core system setup and updates
- Essential utilities
- Firmware and microcode
- Firewall (UFW with sane defaults)

desktop/
User-space desktop stack.

Includes:
- Mesa / Vulkan userspace
- PipeWire + WirePlumber
- Flatpak integration
- ZRAM
- Sysctl tuning
- Desktop utilities

kernel/
Explicit kernel choices:
- Debian backported kernel
- Liquorix
- XanMod

Only one kernel should be installed.

hardware/
Vendor-specific hardware support.

Includes:
- NVIDIA proprietary CUDA drivers
- NVIDIA Open Kernel Modules
- VAAPI / Vulkan tools

No hardware is auto-detected.

profiles/
Optional capability layers.

Includes:
- gaming-meta.sh (runtimes and infrastructure)
- gaming-applications.sh (actual applications)
- install-heroic.sh
- install-github-desktop.sh

Profiles are opt-in.

## Usage

Interactive setup:
```bash
curl -fsSL https://raw.githubusercontent.com/habibimedwassim/debian-scripts/main/setup.sh | bash
```

Run a single script remotely:
```bash
curl -fsSL https://raw.githubusercontent.com/habibimedwassim/debian-scripts/main/profiles/gaming-meta.sh | bash
```

Local execution (recommended):
```bash
git clone https://github.com/habibimedwassim/debian-scripts.git
cd debian-scripts
chmod +x **/*.sh
./setup.sh
```
## Assumptions

- Debian-based system (Debian 13)
- amd64 architecture
- Network access
- User has sudo privileges

## Security

Scripts may:
- Install packages from official repositories
- Add third-party repositories explicitly
- Download .deb files from upstream sources
- Configure a basic firewall

Review scripts before running them.

## License

Do whatever you want with this.
No support is provided.
