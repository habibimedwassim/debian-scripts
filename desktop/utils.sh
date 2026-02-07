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
