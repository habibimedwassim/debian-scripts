# debian-scripts

Personal, opinionated Debian setup scripts.

This repository exists for one reason: **fast, repeatable Debian installs without ceremony**. No frameworks, no Ansible, no meta-packages pretending to be something they are not. Just shell scripts that do exactly what they say.

This is **not** a general-purpose project. It is designed for personal use on Debian-based systems (tested on Debian 13) and assumes you know what you are running.

---

## What this repo is

- A collection of **modular Bash scripts**
- Each script has a **single responsibility**
- Scripts can be run **individually** or via a full orchestrator
- Remote execution via `curl | bash` is supported

## What this repo is not

- Not a configuration management system
- Not a distro replacement
- Not interactive
- Not safe for blind execution by strangers

---

## Script categories

### base/
Core system setup. These scripts are expected to run on **every install**.

- System updates and architecture setup
- Firmware and microcode
- Fonts
- Hardware utilities

If something belongs here, removing it would make the system incomplete.

---

### desktop/
User-space desktop stack.

- Mesa / Vulkan
- PipeWire + WirePlumber
- Flatpak
- ZRAM
- Sysctl tuning

These scripts assume a modern desktop environment and user session.

---

### kernel/
Explicit kernel decisions.

Currently:
- Official backported kernel
- Liquorix kernel installer
- XanMod kernel

Kernel logic is intentionally isolated, just pick whatever.

---

### hardware/
Vendor-specific hardware support.

Currently:
- NVIDIA (CUDA repo, nvidia-open, VAAPI, Vulkan tools)

Nothing here should ever be auto-detected.

---

### profiles/
Optional capability layers inspired by Arch/CachyOS profiles.

- `gaming-meta.sh` – runtimes and infrastructure
- `gaming-applications.sh` – actual applications
- `install-heroic.sh` – custom GitHub installer
- `install-github-desktop.sh` – custom GitHub installer

Profiles are **opt-in** by design.

---

## Usage

### Run everything

```bash
curl -fsSL https://raw.githubusercontent.com/habibimedwassim/debian-scripts/main/setup.sh | bash
```

This runs the full stack in a fixed order. Scripts internally use `sudo` where required.

---

### Run a single script remotely

Example: install gaming infrastructure only

```bash
curl -fsSL \
https://raw.githubusercontent.com/habibimedwassim/debian-scripts/main/profiles/gaming-meta.sh \
| bash
```

---

### Local execution (recommended)

```bash
git clone https://github.com/habibimedwassim/debian-scripts.git
cd debian-scripts
chmod +x **/*.sh
./setup.sh
```

This allows inspection and selective execution.

---

## Design principles

- **Explicit over clever**
- **One responsibility per script**
- **No shared state or hidden dependencies**
- **Failure should be loud and immediate**

If a script breaks, it should be obvious why.

---

## Assumptions

- Debian-based system (Debian 13)
- amd64 architecture
- Network access
- User has sudo privileges

No attempt is made to support other architectures or distributions.

---

## Security note

These scripts:
- Pull packages from official repositories
- Add third-party repositories explicitly
- Download `.deb` files from GitHub releases when necessary

You are expected to review scripts before running them. No guarantees are made.

---

## License

Do whatever you want with this. Break it, fork it, delete it.

There is no support obligation.

