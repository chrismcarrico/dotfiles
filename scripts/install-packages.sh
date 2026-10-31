#!/usr/bin/env bash
# Install the packages the zsh config depends on (Arch Linux only).
set -euo pipefail

packages=(zsh git curl fzf neovim powerline-fonts)

if ! command -v pacman >/dev/null; then
  echo "packages: pacman not found, install these manually: ${packages[*]}"
  exit 0
fi

missing=()
for pkg in "${packages[@]}"; do
  pacman -Qq "$pkg" >/dev/null 2>&1 || missing+=("$pkg")
done

if [[ ${#missing[@]} -eq 0 ]]; then
  echo "packages: all installed"
  exit 0
fi

# Unattended runs (e.g. Ansible) have no terminal for a sudo password prompt.
if [[ ! -t 0 ]] && ! sudo -n true 2>/dev/null; then
  echo "packages: can't sudo without a terminal, install these manually: ${missing[*]}"
  exit 0
fi

echo "packages: installing ${missing[*]}"
sudo pacman -S --needed --noconfirm "${missing[@]}"
