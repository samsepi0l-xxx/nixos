let
  username = "samsepi0l";
  homeDirectory = "/home/samsepi0l";
in
{ pkgs, impurity, ... }: {
  imports = [
    ## Dotfiles (manual)
    ./dotfiles.nix
    # Stuff
    ./packages.nix
  ];

  home = {
    inherit username homeDirectory;
    sessionVariables = {
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
    };
    sessionPath = [
      "$HOME/.local/bin"
    ];
  };

  xdg.userDirs = {
    createDirectories = true;
  };

  programs = {
    home-manager.enable = true;
  };
  home.stateVersion = "25.05"; # this must be the version at which you have started using the program
}
