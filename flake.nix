{
  description = "S4MMY N1X05 C0NF1GUR4T10N";

  inputs = {
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    impurity.url = "github:outfoxxed/impurity.nix";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, neovim-nightly-overlay, ... }:
  {
    nixosConfigurations = import ./hosts { inherit self; };
  };
}
