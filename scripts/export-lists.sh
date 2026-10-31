#!/usr/bin/env bash
# Write the installed package and extension lists to lists/.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "$repo_dir/lists"

pacman -Qqe > "$repo_dir/lists/pacman-explicit.txt"
pacman -Qqem > "$repo_dir/lists/pacman-foreign.txt" || true
code --list-extensions > "$repo_dir/lists/vscode-extensions.txt"

echo "export-lists: wrote $repo_dir/lists"
