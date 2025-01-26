{
  description = "Sam's flake";

  inputs = {
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    impurity.url = "github:outfoxxed/impurity.nix";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, neovim-nightly-overlay, ... }@inputs: let
    overlays = [
      neovim-nightly-overlay.overlays.default
    ]; 
  in {
    nixosConfigurations = import ./hosts { inherit self; };
    homeConfigurations = {
      samsepi0l = home-manager.lib.homeManagerConfiguration {
        modules = [
          {
            nixpkgs.overlays = overlays;
          }
        ];
      };
    };
  };
}

