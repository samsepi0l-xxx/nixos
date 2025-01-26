{ self, ... }:
let
  inherit (self) inputs;
  inherit (inputs) nixpkgs home-manager;

  # set the entrypoint for home-manager configurations
  homeDir = self + /homes;
  # create an alias for the home-manager nixos module
  hm = home-manager.nixosModules.home-manager;

  # if a host uses home-manager, then it can simply import this list
  homes = [
    homeDir
    hm
  ];
in
{
  "nixos" = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules =
      [

        ./nixos # this imports your entire host configuration in one swoop

        # this part is basically the same as putting configuration in your
        # configuration.nix, but is done on the topmost level for your convenience
        {
          networking.hostName = "nixos";
          _module.args = { username = "samsepi0l"; };
        }
      ]
      ++ homes; # imports the home-manager related configurations
  };
}
