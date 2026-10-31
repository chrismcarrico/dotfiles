#!/usr/bin/env bash
# Symlink each file in home/ into $HOME, backing up any file already there.
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
stamp="$(date +%Y%m%d-%H%M%S)"

while IFS= read -r -d '' source; do
  target="$HOME/${source#"$repo_dir"/home/}"

  if [[ "$target" -ef "$source" ]]; then
    echo "link: $target already linked"
    continue
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    echo "link: backing up $target to $target.bak-$stamp"
    mv "$target" "$target.bak-$stamp"
  fi

  mkdir -p "$(dirname "$target")"
  ln -s "$source" "$target"
  echo "link: $target -> $source"
done < <(find "$repo_dir/home" -type f -print0)
