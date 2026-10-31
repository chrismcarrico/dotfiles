#!/usr/bin/env bash
# Make zsh the login shell.
set -euo pipefail

zsh_path="$(command -v zsh || true)"
current="$(getent passwd "$(id -un)" | cut -d: -f7)"

if [[ -z "$zsh_path" ]]; then
  echo "shell: zsh not installed, skipping"
elif [[ "$(basename "$current")" == "zsh" ]]; then
  echo "shell: zsh is already the login shell"
elif [[ -t 0 ]]; then
  chsh -s "$zsh_path"
else
  echo "shell: no terminal for chsh, run: chsh -s $zsh_path"
fi
