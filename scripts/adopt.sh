#!/usr/bin/env bash
# Move files from $HOME into home/ and symlink them back.
# Usage: scripts/adopt.sh <path>...   (absolute, or relative to the current directory)
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Keep in sync with .gitignore.
is_denied() {
  case "$1" in
    .ssh/*|.gnupg/*|.claude/.credentials.json|.claude.json*) return 0 ;;
    .config/kdeconnect/*|.config/Claude/*|.config/libaccounts-glib/*) return 0 ;;
    *.pem|*.key|*id_rsa*|*id_ed25519*|*id_ecdsa*) return 0 ;;
    *_history|.z|.zcompdump*|*.bak-*) return 0 ;;
  esac
  return 1
}

for path in "$@"; do
  # Resolve the parent only, so a symlink at the path itself stays visible.
  absolute="$(cd "$(dirname "$path")" && pwd)/$(basename "$path")"
  relative="${absolute#"$HOME"/}"

  if [[ "$relative" == "$absolute" ]]; then
    echo "adopt: $path is not under \$HOME" >&2
    exit 1
  fi

  if is_denied "$relative"; then
    echo "adopt: refusing $relative (on the denylist)" >&2
    exit 1
  fi

  stored="$repo_dir/home/$relative"

  if [[ "$absolute" -ef "$stored" ]]; then
    echo "adopt: $relative already adopted"
    continue
  fi

  if [[ -L "$absolute" || ! -f "$absolute" ]]; then
    echo "adopt: $relative is not a regular file" >&2
    exit 1
  fi

  mkdir -p "$(dirname "$stored")"
  mv "$absolute" "$stored"
  ln -s "$stored" "$absolute"
  echo "adopt: $relative"
done
