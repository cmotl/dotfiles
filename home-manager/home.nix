{ pkgs, ... }: {
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    neovim
    tmux
    tree-sitter
    stow
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.home-manager.enable = true;
}
