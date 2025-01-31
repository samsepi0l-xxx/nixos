{ config, lib, pkgs, ... }:

{
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;

  environment.systemPackages = with pkgs; [
    impala
  ];
}
