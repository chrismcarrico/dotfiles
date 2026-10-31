# dotfiles

Zsh setup for an Arch Linux dev machine: Oh My Zsh with the agnoster theme, plugins, PATH entries and shell aliases.

## Set up a new machine

```bash
git clone https://github.com/chrismcarrico/dotfiles ~/dotfiles
```

```bash
~/dotfiles/setup.sh
```

Then open a new terminal, or run `exec zsh`. The script is safe to re-run, and works from any clone location.

`setup.sh` runs these steps in order, and each can also be run by itself:

| Script | What it does |
|---|---|
| `scripts/install-packages.sh` | Installs `zsh`, `git`, `curl`, `fzf`, `neovim` and `powerline-fonts` with pacman. On other distros it prints the list instead. |
| `scripts/install-oh-my-zsh.sh` | Clones Oh My Zsh to `~/.oh-my-zsh` if it's missing. |
| `scripts/link.sh` | Symlinks each file in `home/` into `$HOME`. Existing files are moved to `<file>.bak-<timestamp>`. |
| `scripts/set-shell.sh` | Makes zsh the login shell if it isn't already. |

The [dev-setup](https://github.com/chrismcarrico/dev-setup) Ansible playbook clones this repo to `~/.dotfiles` and runs `setup.sh`. With no terminal attached, the sudo and `chsh` steps print what to do by hand instead of prompting.

## What's included

- `home/.zshrc`: theme, plugins (`git docker fzf sudo z colored-man-pages`), PATH and editor settings.
- `home/.bash_aliases`: navigation, listing, Docker and pacman aliases, loaded by `.zshrc`.

## Making changes

The files in `$HOME` are symlinks, so edits to `~/.zshrc` change the repo copy directly. Commit them here as usual. To add another dotfile, put it in `home/` and run `scripts/link.sh`.

## Fonts

The agnoster prompt needs powerline glyphs. If its arrows show as boxes, set your terminal font to one that includes them, such as Hack.

## Not included

`~/.gitconfig` stays out of this repo. Set your identity on a new machine with:

```bash
git config --global user.name "Your Name"
```

```bash
git config --global user.email "you@example.com"
```
