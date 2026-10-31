#!/usr/bin/env bash
# Bootstrap this machine from the dotfiles repo. Safe to re-run.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$repo_dir/scripts/install-packages.sh"
"$repo_dir/scripts/install-oh-my-zsh.sh"
"$repo_dir/scripts/link.sh"
"$repo_dir/scripts/set-shell.sh"

echo "Done. Open a new terminal or run: exec zsh"
