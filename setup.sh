#!/usr/bin/env bash
set -e

if [ -t 0 ] || [ -t 1 ]; then
    exec </dev/tty
fi

GITHUB_BASE="https://raw.githubusercontent.com/habibimedwassim/debian-scripts/main"

read_choice() {
    local var="$1"
    local prompt="$2"
    IFS= read -r -p "$prompt" "$var" </dev/tty || true
}

run_remote() {
    local path="$1"
    echo
    echo "==> Running $path"
    bash -c "$(curl -fsSL "$GITHUB_BASE/$path")"
}

pause() {
    read -rp "Press Enter to continue..."
}

### ---------------------------
### Submenus
### ---------------------------

kernel_menu() {
    clear
    echo "Kernel selection"
    echo "----------------"
    echo "1) Liquorix"
    echo "2) XanMod"
    echo "3) Backported"
    echo "0) Back"
    echo

    read -rp "Choice: " k

    case "$k" in
        1) run_remote "kernel/liquorix.sh" ;;
        2) run_remote "kernel/xanmod.sh" ;;
        3) run_remote "kernel/backported.sh" ;;
        0) return ;;
        *) echo "Invalid choice"; sleep 1 ;;
    esac
}

nvidia_menu() {
    clear
    echo "NVIDIA driver selection"
    echo "-----------------------"
    echo "1) nvidia-open (Turing+)"
    echo "2) Proprietary CUDA drivers"
    echo "0) Back"
    echo

    read -rp "Choice: " n

    case "$n" in
        1) run_remote "hardware/nvidia-open.sh" ;;
        2) run_remote "hardware/nvidia-cuda.sh" ;;
        0) return ;;
        *) echo "Invalid choice"; sleep 1 ;;
    esac
}

flatpak_menu() {
    clear
    echo "Flatpak desktop integration"
    echo "----------------------------"
    echo "1) KDE Plasma"
    echo "2) GNOME"
    echo "0) Back"
    echo

    read -rp "Choice: " f

    run_remote "desktop/flatpak-common.sh"

    case "$f" in
        1) run_remote "desktop/kde-flatpak.sh" ;;
        2) run_remote "desktop/gnome-flatpak.sh" ;;
        0) return ;;
        *) echo "Invalid choice"; sleep 1 ;;
    esac
}

### ---------------------------
### Main menu
### ---------------------------

while true; do
    clear
    echo "Debian Scripts Setup"
    echo "===================="
    echo
    echo "1) Base system"
    echo "2) Desktop stack"
    echo "3) Kernel"
    echo "4) NVIDIA drivers"
    echo "5) Gaming profile"
    echo "6) Applications (Heroic, GitHub Desktop)"
    echo
    echo "0) Exit"
    echo

    read -rp "Select an option: " choice

    case "$choice" in
        1)
            run_remote "base/system.sh"
            run_remote "base/firmware.sh"
            run_remote "base/firewall.sh"
            pause
            ;;
        2)
            run_remote "desktop/graphics-mesa.sh"
            run_remote "desktop/audio-pipewire.sh"
            flatpak_menu
            run_remote "desktop/sysctl.sh"
            run_remote "desktop/zram.sh"
            run_remote "desktop/utils.sh"
            pause
            ;;
        3)
            kernel_menu
            pause
            ;;
        4)
            nvidia_menu
            pause
            ;;
        5)
            run_remote "profiles/gaming-meta.sh"
            run_remote "profiles/gaming-applications.sh"
            pause
            ;;
        6)
            run_remote "profiles/install-heroic.sh"
            run_remote "profiles/install-github-desktop.sh"
            pause
            ;;
        0)
            echo "Exiting. Reboot recommended."
            exit 0
            ;;
        *)
            echo "Invalid selection"
            sleep 1
            ;;
    esac
done
