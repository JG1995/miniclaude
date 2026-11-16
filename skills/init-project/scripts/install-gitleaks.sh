#!/bin/sh
# Installs gitleaks for the pre-commit hook when it is missing or too old.
# The hook runs `gitleaks git --pre-commit`, which needs gitleaks 8.19 or later.
# - With Homebrew available, it runs `brew install gitleaks` or `brew upgrade gitleaks`.
# - Otherwise it downloads the latest release for this OS and CPU from GitHub, checks it
#   against the release's published checksums, and puts the binary in ~/.local/bin.
# Needs no sudo. Prints what it did and exits non-zero when gitleaks is still unusable.
set -eu

usable() { command -v gitleaks >/dev/null 2>&1 && gitleaks git --help >/dev/null 2>&1; }

if usable; then
  echo "gitleaks $(gitleaks version) is already installed at $(command -v gitleaks)."
  exit 0
fi

if command -v brew >/dev/null 2>&1; then
  if brew list gitleaks >/dev/null 2>&1; then
    echo "Upgrading gitleaks with Homebrew."
    brew upgrade gitleaks
  else
    echo "Installing gitleaks with Homebrew."
    brew install gitleaks
  fi
else
  case "$(uname -s)" in
    Linux) os=linux ;;
    Darwin) os=darwin ;;
    *) echo "No gitleaks build for $(uname -s) is handled here. Install it by hand: https://github.com/gitleaks/gitleaks#installing" >&2; exit 1 ;;
  esac
  case "$(uname -m)" in
    x86_64 | amd64) arch=x64 ;;
    aarch64 | arm64) arch=arm64 ;;
    *) echo "No gitleaks build for $(uname -m) is handled here. Install it by hand: https://github.com/gitleaks/gitleaks#installing" >&2; exit 1 ;;
  esac

  # The latest-release URL redirects to .../releases/tag/vX.Y.Z, which avoids the rate-limited API.
  tag=$(curl -fsSLI -o /dev/null -w '%{url_effective}' https://github.com/gitleaks/gitleaks/releases/latest)
  tag=${tag##*/}
  version=${tag#v}
  case "$version" in
    [0-9]*.[0-9]*.[0-9]*) ;;
    *) echo "Could not find the latest gitleaks release (got '$tag')." >&2; exit 1 ;;
  esac

  archive="gitleaks_${version}_${os}_${arch}.tar.gz"
  base="https://github.com/gitleaks/gitleaks/releases/download/$tag"
  tmp=$(mktemp -d)
  trap 'rm -rf "$tmp"' EXIT

  echo "Downloading gitleaks $version ($os, $arch) from GitHub."
  curl -fsSL -o "$tmp/$archive" "$base/$archive"
  curl -fsSL -o "$tmp/checksums.txt" "$base/gitleaks_${version}_checksums.txt"

  expected=$(awk -v f="$archive" '$2 == f { print $1 }' "$tmp/checksums.txt")
  if command -v sha256sum >/dev/null 2>&1; then
    actual=$(sha256sum "$tmp/$archive" | awk '{ print $1 }')
  else
    actual=$(shasum -a 256 "$tmp/$archive" | awk '{ print $1 }')
  fi
  if [ -z "$expected" ] || [ "$expected" != "$actual" ]; then
    echo "The downloaded archive does not match the published checksum, so it was not installed." >&2
    exit 1
  fi

  tar -xzf "$tmp/$archive" -C "$tmp" gitleaks
  mkdir -p "$HOME/.local/bin"
  mv "$tmp/gitleaks" "$HOME/.local/bin/gitleaks"
  chmod +x "$HOME/.local/bin/gitleaks"
  echo "Installed gitleaks $version at $HOME/.local/bin/gitleaks (checksum verified)."

  case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) echo "$HOME/.local/bin is not on PATH. Add it in your shell profile, for example: export PATH=\"\$HOME/.local/bin:\$PATH\"" >&2 ;;
  esac
fi

hash -r 2>/dev/null || true
if usable; then
  echo "gitleaks $(gitleaks version) is ready at $(command -v gitleaks)."
else
  if found=$(command -v gitleaks 2>/dev/null); then
    echo "gitleaks is still not usable: the first gitleaks on PATH is the old one at $found. Make sure the new one comes first on PATH." >&2
  else
    echo "gitleaks is still not usable: it is not on PATH yet." >&2
  fi
  exit 1
fi
