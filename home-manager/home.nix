{ pkgs, lib, ... }: {
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    neovim
    tmux
    tree-sitter
    stow
    nerd-fonts.hack
    # Modern bash (macOS ships 3.2) so direnv evaluates Nix dev-env scripts
    # without choking on bash 4+ syntax.
    bashInteractive
  ];

  # Symlink Hack Nerd Font into ~/Library/Fonts (macOS)
  home.activation.installFonts = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/Library/Fonts"
    find ${pkgs.nerd-fonts.hack}/share/fonts -name "*.ttf" -exec ln -sf {} "$HOME/Library/Fonts/" \;
  '';

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    # Robust, cached `use flake` (writes ~/.config/direnv/direnvrc).
    nix-direnv.enable = true;
  };

  programs.home-manager.enable = true;
}
