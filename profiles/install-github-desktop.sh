#!/usr/bin/env bash
set -e

REPO="shiftkey/desktop"
PKG_NAME="github-desktop"

# --- Dependency check ---
MISSING_DEPS=()

for cmd in curl jq dpkg; do
  command -v "$cmd" >/dev/null 2>&1 || MISSING_DEPS+=("$cmd")
done

if [ ${#MISSING_DEPS[@]} -ne 0 ]; then
  echo "Installing missing dependencies: ${MISSING_DEPS[*]}"
  sudo apt update
  sudo apt install -y "${MISSING_DEPS[@]}"
fi

# --- Fetch release info ---
echo "Fetching latest GitHub Desktop release info..."

RELEASE_JSON=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest")

LATEST_VERSION=$(echo "$RELEASE_JSON" | jq -r '.tag_name')

if [[ -z "$LATEST_VERSION" || "$LATEST_VERSION" == "null" ]]; then
  echo "❌ Failed to determine latest version."
  exit 1
fi

# --- Installed version ---
INSTALLED_VERSION=""
if dpkg -s "$PKG_NAME" >/dev/null 2>&1; then
  INSTALLED_VERSION=$(dpkg-query -W -f='${Version}' "$PKG_NAME")
fi

echo "Installed version: ${INSTALLED_VERSION:-none}"
echo "Latest version:    $LATEST_VERSION"

# --- Select amd64 .deb ---
DOWNLOAD_URL=$(echo "$RELEASE_JSON" | jq -r '
  .assets[]
  | select(.name | test("\\.deb$"))
  | select(.name | test("amd64"))
  | .browser_download_url
')

if [[ -z "$DOWNLOAD_URL" ]]; then
  echo "❌ No amd64 .deb package found."
  exit 1
fi

FILENAME=$(basename "$DOWNLOAD_URL")

echo "Downloading $FILENAME..."
curl -fL -o "$FILENAME" "$DOWNLOAD_URL"

echo "Installing GitHub Desktop..."
sudo dpkg -i "$FILENAME" || sudo apt-get install -f -y

rm -f "$FILENAME"

echo "🚀 GitHub Desktop installed / updated"
