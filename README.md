# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/) and [Home Manager](https://github.com/nix-community/home-manager).

## Structure

```
dotfiles/
  bash/       → ~/.bash_profile, ~/.aliases.sh, ~/.shell_colors.sh, ~/.bash-git-prompt/
  tmux/       → ~/.tmux.conf
  vim/        → ~/.vimrc
  nvim/       → ~/.config/nvim/   (kickstart-based Neovim config)
  nix/        → ~/.config/nix/nix.conf
  home-manager/
    flake.nix
    home.nix   ← packages managed here
```

## Bootstrap (new machine)

1. **Install Nix** — use the [Determinate Systems installer](https://github.com/DeterminateSystems/nix-installer):
   ```sh
   curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
   ```

2. **Clone dotfiles**
   ```sh
   git clone <your-repo> ~/dotfiles
   ```

3. **Enable Nix experimental features** — required before running any `nix` commands:
   ```sh
   mkdir -p ~/.config/nix
   cp ~/dotfiles/nix/.config/nix/nix.conf ~/.config/nix/nix.conf
   ```

4. **Link dotfiles** — use a temporary `nix shell` to avoid a conflicting imperative install:
   ```sh
   nix shell nixpkgs#stow --command stow --target="$HOME" -d "$HOME/dotfiles" bash tmux vim nvim nix
   ```

5. **Activate Home Manager** — this installs stow (and everything else) permanently:
   ```sh
   cd ~/dotfiles/home-manager
   nix run home-manager/master -- switch --flake .#cmotl
   ```

After step 4, `home-manager` is on your PATH for future updates:

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
2. Run `stow --target="$HOME" git`
