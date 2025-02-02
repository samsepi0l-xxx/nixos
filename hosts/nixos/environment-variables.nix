{ pkgs, ... }:

{
  # Setup Env Variables
  environment.variables.SPOTIFY_PATH = "${pkgs.spotify}/";
  environment.variables.JDK_PATH = "${pkgs.jdk17}/";
  environment.variables.NODEJS_PATH = "${pkgs.nodePackages_latest.nodejs}/";
  environment.variables.IMPURITY_PATH = "~/GitHub/nixos";
  environment.variables.XDG_CONFIG_HOME = "~/.config";
}
