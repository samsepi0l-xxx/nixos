let
  username = "samsepi0l";
  homeDirectory = "/home/samsepi0l";
in
{ inputs, pkgs, impurity, ... }: {
  imports = [
    ./dotfiles.nix
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
    firefox = {
      enable = true;
    };
    neovim = {
      enable = true;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    };
  };

  home.stateVersion = "25.05"; # Don't change this ! 
}

