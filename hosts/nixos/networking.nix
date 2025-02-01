{ config, lib, pkgs, ... }:

{
  networking.hostName = "nixos"; 
  programs.nm-applet.enable = true;

  networking.networkmanager = {
    enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    impala
  ];

  systemd.services.networkd = {
    enable = false;
  };
}
