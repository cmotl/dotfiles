#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"
NIX=(nix --extra-experimental-features "nix-command flakes")

# Remove any real files that stow would conflict with
for f in "$HOME/.config/nix/nix.conf"; do
  if [ -e "$f" ] && [ ! -L "$f" ]; then
    rm "$f"
  fi
done

# Link all stow packages
"${NIX[@]}" shell nixpkgs#stow --command \
  stow --target="$HOME" -d "$DOTFILES" bash tmux vim nvim nix

# Activate home-manager (installs all packages declaratively)
"${NIX[@]}" run home-manager/master -- switch --flake "$DOTFILES/home-manager#cmotl"

echo "Done. Open a new shell to pick up the new environment."
