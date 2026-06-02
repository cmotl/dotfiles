# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/) and [Home Manager](https://github.com/nix-community/home-manager).

## Structure

```
dotfiles/
  bash/       → ~/.bash_profile, ~/.aliases.sh, ~/.shell_colors.sh, ~/.bash-git-prompt/
  tmux/       → ~/.tmux.conf
  vim/        → ~/.vimrc
  nvim/       → ~/.config/nvim/   (kickstart-based Neovim config)
  home-manager/
    flake.nix
    home.nix   ← packages managed here
```

## Setup

### 1. Stow (dotfile symlinks)

```sh
brew install stow   # or: nix profile install nixpkgs#stow
cd ~/dotfiles
stow --target=~ bash tmux vim nvim
```

### 2. Home Manager (packages)

Requires [Nix](https://nixos.org/download/) with flakes enabled.

```sh
cd ~/dotfiles/home-manager
nix run home-manager/master -- switch --flake .#cmotl
```

After the first run, `home-manager` is on your PATH:

```sh
home-manager switch --flake ~/dotfiles/home-manager#cmotl
```

## Adding packages

Edit `home-manager/home.nix`, then:

```sh
home-manager switch --flake ~/dotfiles/home-manager#cmotl
```

## Adding a new dotfile

1. Create a package dir mirroring the target path, e.g. `git/.gitconfig`
2. Run `stow --target=~ git`
