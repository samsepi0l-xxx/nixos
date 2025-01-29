{ pkgs, ... }:

{
  # Enable Bluetooth
  hardware.bluetooth.enable = false;
  hardware.bluetooth.powerOnBoot = false;

  environment.systemPackages = with pkgs; [
    overskride
  ];
}
