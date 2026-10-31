#!/usr/bin/env bash
# Symlink everything in home/ into $HOME, backing up any file already there.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
stamp="$(date +%Y%m%d-%H%M%S)"

shopt -s dotglob nullglob
for source in "$repo_dir"/home/*; do
  target="$HOME/$(basename "$source")"

  if [[ "$target" -ef "$source" ]]; then
    echo "link: $target already linked"
    continue
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    echo "link: backing up $target to $target.bak-$stamp"
    mv "$target" "$target.bak-$stamp"
  fi

  ln -s "$source" "$target"
  echo "link: $target -> $source"
done
