{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.lxqt.enable = true;
    deviceSection = ''
      Option "PreferredMode" "1336x736"
    '';
  }; 
  environment.systemPackages = with pkgs; [
    xorg.libxcb
  ];
}
