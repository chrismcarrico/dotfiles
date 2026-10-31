# dotfiles

Backup of the dotfiles and configs in my home directory, for an Arch Linux machine running KDE Plasma.

`home/` mirrors `$HOME`. Each file in it is symlinked to the same path in `$HOME`, so editing `~/.zshrc` changes the repo copy directly. Commit the changes here as usual.

## Back up a new file

```bash
scripts/adopt.sh ~/.config/some-app/config
```

This moves the file into `home/` and symlinks it back. It refuses anything on its denylist. Run `scripts/export-lists.sh` to refresh the package and extension lists in `lists/`.

## Restore on a new machine

```bash
git clone https://github.com/chrismcarrico/dotfiles ~/Source/dotfiles
```

```bash
~/Source/dotfiles/scripts/link.sh
```

The script is safe to re-run. Existing files are moved to `<file>.bak-<timestamp>`.

Reinstall packages from the lists:

```bash
sudo pacman -S --needed - < lists/pacman-explicit.txt
```

`pacman-explicit.txt` includes the AUR packages in `pacman-foreign.txt`, which pacman can't install, so remove those first and install them with `yay`.

`.zshrc` needs [Oh My Zsh](https://ohmyz.sh) in `~/.oh-my-zsh`. The agnoster prompt also needs a font with powerline glyphs, such as Hack.

## Not included

- Secrets: SSH keys, the Claude login, KDE Connect keys. `.gitignore` blocks these too. Back up the SSH key somewhere else, such as a password manager.
- Browser profiles, caches, virtualenvs and toolchains.
- Shell history and app state.
- `kwinoutputconfig.json`, which is specific to this machine's monitors.
- GTK assets and colours, which KDE generates.

## KDE configs

KDE apps may replace a symlink with a regular file when they save. If that happens, the repo stops tracking that file. Check with:

```bash
find ~/.config -maxdepth 1 -type f
```

Before re-linking, copy the newer file over the repo version, because `link.sh` moves it aside.
