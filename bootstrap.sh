#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

# Enable nix experimental features if not already set
mkdir -p "$HOME/.config/nix"
if ! grep -q 'experimental-features' "$HOME/.config/nix/nix.conf" 2>/dev/null; then
  echo 'experimental-features = nix-command flakes' >> "$HOME/.config/nix/nix.conf"
fi

# Remove any real files that stow would conflict with
# (e.g. nix.conf written above, or files left by a previous partial run)
for f in "$HOME/.config/nix/nix.conf"; do
  if [ -e "$f" ] && [ ! -L "$f" ]; then
    rm "$f"
  fi
done

# Link all stow packages
nix shell nixpkgs#stow --command \
  stow --target="$HOME" -d "$DOTFILES" bash tmux vim nvim nix

# Activate home-manager (installs all packages declaratively)
nix run home-manager/master -- switch --flake "$DOTFILES/home-manager#cmotl"

echo "Done. Open a new shell to pick up the new environment."
