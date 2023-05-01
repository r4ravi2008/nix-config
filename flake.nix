{
  description = "my minimal flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }: {
    darwinConfigurations = {
      "Ravis-MacBook-Pro" = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        pkgs = import nixpkgs { system = "x86_64-darwin"; config = { allowUnfree = true; }; };
        modules = [
          ./modules/darwin
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              users.rkommineni.imports = [ ./modules/home-manager ];
            };
          }
        ];
      };
    };
  };
}
