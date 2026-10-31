#!/usr/bin/env bash
# Clone Oh My Zsh. Uses git rather than the upstream installer, which rewrites ~/.zshrc.
set -euo pipefail

omz_dir="$HOME/.oh-my-zsh"

if [[ -d "$omz_dir" ]]; then
  echo "oh-my-zsh: already installed"
  exit 0
fi

echo "oh-my-zsh: cloning to $omz_dir"
git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git "$omz_dir"
