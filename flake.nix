{
  description = "Sam's flake";

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations = import ./hosts { inherit self; };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

}
