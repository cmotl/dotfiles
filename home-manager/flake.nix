{
  description = "cmotl home-manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      user = builtins.getEnv "USER";
      homeDir = builtins.getEnv "HOME";
    in {
      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        modules = [
          { home.username = user; home.homeDirectory = homeDir; }
          ./home.nix
        ];
      };
    };
}
