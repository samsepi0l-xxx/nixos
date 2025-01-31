{ config, username, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    slack
    aws-sam-cli
    awscli2
    cargo
    gnumake
    cmake
    firebase-tools
    asdf-vm
  ];
}
